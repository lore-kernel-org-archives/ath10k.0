Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679ACECAAD4
	for <ath10k@archiver.kernel.org>; Sat,  3 Sep 2022 05:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lqWT6srgjY2aKdnmF7ShNJ5HJOHXblam9xRzG1rs7lc=; b=wWepmuqoSY99c1
	e9JwL+VFfAYVBfvlPv7c8ppjNh8Xah1tNXWQs+tvIUxGFzRD23z1EtKDt3n6/DRmNSh5jJxtkMhgP
	JD5vOjtzGsaKh2ya5S0W3JSWlcJYNEK7WKW5ffO1OmM82xjVzeuH0txyaM/Knpp7mLlL4zt8gyQcx
	Ug6v268JPsDodHTB8mCh2LChJftKWHlq9ktHOhQ4lFr1HuCcKzt7brmLk61okYJPCQHIk1gFkteMm
	XggAQvSyH9FJUjLfGF1MqgV+B/NtwlS01loUOlAcTdaeFyGs55bPq/fFoRAmqB5ndHyOG/wmiub+3
	PhhExT2jl+W3gA8uU9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oULvq-0024Vq-2J; Sat, 03 Sep 2022 05:43:02 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oULvn-0024I2-GA
	for ath10k@lists.infradead.org; Sat, 03 Sep 2022 05:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662183779; x=1693719779;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=73wYZNhDzk8Z5V6NyGU2Oa+8Og4calBVCqEngVxkFb4=;
  b=klQLrhm3F+Qv43vD48S1sFe6Zg/vm+/r2hlsQg3AXpH4aWEgYbmjfhcp
   0mdzHea4fy4RIW47orpxoFms7EQOl2uw4dFgFPrQwIVAKVV1+Ia7t7vXI
   +y38PhmyqSc4BH9wjxOo/Wsns5viK5OUb2qSIbwLTdmdi5NCQKtI4qxxs
   aD9jOqbRe5UiUAkCnu1GI+rESSkIR09aC16sqW11WrqOJsfT2+Y/aGKV3
   x0+nE+ExGMcaw94kdb5m4dkfackLTAhPNfgMy1hJAOxJ4PikLaFcuOPbr
   rwt3IKoFQz7khDbgTscktcF+9kC/S8AhRkKdEZ5C/kYQUXPbi7ahqOXB9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="382434357"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="382434357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 22:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="681506665"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2022 22:42:51 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oULvf-00017X-09;
	Sat, 03 Sep 2022 05:42:51 +0000
Date: Sat, 03 Sep 2022 13:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 7d992bd4615c5b1ac4a92f691967d886e2bfec35
Message-ID: <6312e929.cQE9lGqpM9Nwmyvm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_224259_617413_17821F92 
X-CRM114-Status: UNSURE (   5.98  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 7d992bd4615c5b1ac4a92f691967d886e2bfec35  wifi: ath11k: Add support to connect to non-transmit MBSSID profiles

elapsed time: 1010m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20220901
x86_64                        randconfig-a011
powerpc                           allnoconfig
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
x86_64                              defconfig
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                               rhel-8.3
x86_64                        randconfig-a006
sh                               allmodconfig
mips                             allyesconfig
i386                                defconfig
alpha                            allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
i386                          randconfig-a014
m68k                             allmodconfig
i386                          randconfig-a012
arc                              allyesconfig
i386                          randconfig-a016
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220901
hexagon              randconfig-r041-20220901
riscv                randconfig-r042-20220901
s390                 randconfig-r044-20220901
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
