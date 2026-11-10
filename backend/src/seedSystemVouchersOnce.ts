import { initializeDatabase } from './config/database';
import { User } from './models/User';
import { Voucher } from './models/Voucher';

async function seedSystemVouchersOnce() {
  try {
    console.log('🔌 Connecting to database...');
    const connected = await initializeDatabase();
    if (!connected) {
      console.error('❌ Failed to initialize database connection.');
      process.exit(1);
    }

    console.log('🔍 Looking for admin and vendor users...');
    const admin = await User.findOne({ where: { role: 'admin' } });
    const vendor = await User.findOne({ where: { role: 'vendor' } });

    console.log(`Admin ID: ${admin?.id || 'null'}`);
    console.log(`Vendor ID: ${vendor?.id || 'null'}`);

    const now = new Date();
    const nextMonth = new Date();
    nextMonth.setMonth(now.getMonth() + 1);

    const vouchersToSeed = [
      // Platform wide (System)
      {
        code: 'GRABFOOD50K',
        discountType: 'fixed_amount' as const,
        discountValue: 50000,
        minOrderAmount: 150000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: admin?.id || null,
        restaurantId: null,
      },
      {
        code: 'FREESHIP',
        discountType: 'percentage' as const,
        discountValue: 100,
        maxDiscountAmount: 15000,
        minOrderAmount: 40000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: admin?.id || null,
        restaurantId: null,
      },
      {
        code: 'HELLOSUMMER',
        discountType: 'percentage' as const,
        discountValue: 20,
        maxDiscountAmount: 30000,
        minOrderAmount: 50000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: admin?.id || null,
        restaurantId: null,
      },
      {
        code: 'SIEUDEAL100K',
        discountType: 'fixed_amount' as const,
        discountValue: 100000,
        minOrderAmount: 250000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: admin?.id || null,
        restaurantId: null,
      },
      {
        code: 'SAIGON90S',
        discountType: 'fixed_amount' as const,
        discountValue: 15000,
        minOrderAmount: 40000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: admin?.id || null,
        restaurantId: null,
      },
      {
        code: 'ANRATNGON',
        discountType: 'fixed_amount' as const,
        discountValue: 20000,
        minOrderAmount: 80000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: admin?.id || null,
        restaurantId: null,
      },
      // Restaurant specific
      {
        code: 'HUTIEU10',
        discountType: 'percentage' as const,
        discountValue: 10,
        maxDiscountAmount: 10000,
        minOrderAmount: 30000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: vendor?.id || null,
        restaurantId: 'rest-1',
      },
      {
        code: 'COMTAM15',
        discountType: 'fixed_amount' as const,
        discountValue: 15000,
        minOrderAmount: 50000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: vendor?.id || null,
        restaurantId: 'rest-2',
      },
      {
        code: 'BANHMI5K',
        discountType: 'fixed_amount' as const,
        discountValue: 5000,
        minOrderAmount: 20000,
        startDate: now,
        endDate: nextMonth,
        isActive: true,
        createdBy: vendor?.id || null,
        restaurantId: 'rest-5',
      }
    ];

    console.log('🌱 Seeding vouchers into database...');
    for (const voucher of vouchersToSeed) {
      // Xoá trước khi tạo để tránh lỗi trùng lặp mã code
      await Voucher.destroy({ where: { code: voucher.code } });
      await Voucher.create(voucher);
      console.log(`&amp;#9989; Created voucher: ${voucher.code}`);
    }

    console.log('🎉 Seeding system vouchers completed successfully!');
    process.exit(0);
  } catch (error) {
    console.error('❌ Error seeding system vouchers:', error);
    process.exit(1);
  }
}

seedSystemVouchersOnce();
