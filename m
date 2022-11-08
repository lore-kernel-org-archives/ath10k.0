Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B05AC4332F
	for <ath10k@archiver.kernel.org>; Tue,  8 Nov 2022 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7WN4HyeqDrJrwSMZZmZAN5ezNz+dhysj+H9k0HSZ5Lg=; b=LMbUIsK4ujniSB
	iQOe1VqxViz3h3vSFnLy3+64G+QmALzm8nUejbwUtUkwSadbmoxM8FkSOivPzMEEEIlplWp1NBP4E
	Wu1oy/Gs6msPgr2GxjjJodak/PyU4z3l3F8GAYHyZ+kjEfoRou1drTKozPMxJWaiD8W5n5EvN9Elq
	F5it+RLKGj9VTD3Lzvj0VgVfl8x+CnzgLd5EIxDgLeX87t8oGmZT74uNE7fWg8BAxz/Ymp3LlZi9t
	Qy/f/E+U5cSuNu/+gUPIiBrb0ogi22V2yT9XkrUUvfixhN+Fwk6DL+VW89JqWlhacCzziMZkzHHnl
	gOkTPOZz21LzMhMxY5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osIvd-003Pkc-PW; Tue, 08 Nov 2022 07:21:49 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osIva-003Pjm-QV
	for ath10k@lists.infradead.org; Tue, 08 Nov 2022 07:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667892106; x=1699428106;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/04qh/AabgrBphazmUnv2zTkUGKFeJrrTdcS9A3k0hc=;
  b=Q0fAToSivsmb5j+HjjEGImZaIzWRfaEliOgx7V8kLRtvdRKytdegJ9Rc
   gO/DVDjh2q6EafYZO071RxwkXIcRhccEFSqwSvvpS58ROJ7Ez9kuxMC34
   L3SwzXikl4NDrRe0+dtds5++OXOLFuyKlX+92dbPn6L3PGJifZ9AdhGwX
   t9ZUvQEW/uO1BNE3IFlZQg9v7BZ68IseRT4sQIblhPjVVsYGjm9BmBCcB
   nRbeOzGX9L6E32j1RJ/XEB0e5KAOUgBNEuqP90+zkPKbaxNHHaEgpxxmt
   9qjgDIXNF1OIulbQoaQPFZWxiXYTFzhw2xnYpSxc3eEzs2rtzpRQxcQ8y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="311782111"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="311782111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 23:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614179368"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="614179368"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Nov 2022 23:21:40 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osIvT-000011-2j;
	Tue, 08 Nov 2022 07:21:39 +0000
Date: Tue, 08 Nov 2022 14:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 a6d720a7ca6c7f21a6c7bce83129561806e31ce8
Message-ID: <6369f728.0NzhkNOMkOBKhgbW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_232146_931025_A0583793 
X-CRM114-Status: UNSURE (   5.34  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: a6d720a7ca6c7f21a6c7bce83129561806e31ce8  wifi: ath12k: Move destroy_workqueue(xx) to ath12k_core_free()

elapsed time: 753m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221107
ia64                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a004-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a006-20221107
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64               randconfig-a001-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a002-20221107
i386                                defconfig
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221107
riscv                randconfig-r042-20221107
s390                 randconfig-r044-20221107
hexagon              randconfig-r045-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
