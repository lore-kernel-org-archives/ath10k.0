Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B1C77B6C
	for <ath10k@archiver.kernel.org>; Thu, 13 Apr 2023 00:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GWrwLbukDF4xF+3MmWbLv97Z1b6ZmoahLp3Bv0KzOW4=; b=pf3ISVqMpm6Zh2
	z9VWIsY7gpSZTqqjb3fJM1T0ItC3FFpXM7P960XuHQ3x4+zS4fjhPiZLTkp57xnYSefbhgXVTeQMr
	so/EVYhdpw/ROzTjJwLEZkbDyLJF8jqfNox8Arzsi+H+W/rjWniFT0PctKHqY1t0rY5R+yZpfM/MR
	45eo9DvyUw266uv7Gr5xa+f5uIT9HLgisZSD97kzNtPeKf8JCdKnqotQP8PSMQZJLNLxDH3xPchc0
	Vt3LhViGlP2vPaxqNxvz5wxDL3yPrTE6YlHckSMdgQ2Yv49ApIwqCtlUiuFvmy0QFb5PQcebK0rI1
	z9Mt/7++XseEJPqY7Ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkiW-004h4I-09;
	Thu, 13 Apr 2023 00:21:36 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkiS-004h2X-0e
	for ath10k@lists.infradead.org;
	Thu, 13 Apr 2023 00:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681345292; x=1712881292;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EP9OSp9ZTXn6JJB9+dIGU0x3as9h8hC2lKtVBZscwho=;
  b=dPzx+dJsfrXq75stv9diS9J9ykfBc59Ehj1lK3L5TFPJaOpwFH51Nn8P
   I2Xye6maXOKb33mHZAynNBsZxNZYi92p6ZSOpjcj135QbzZy/z+8oDF/n
   NX9qqp4JSgzjA6VnWAnUpFrW9ykdkoDjPjt+nqtIdRCkBMKFNtXtnQCek
   zxj5EO7gh/joBuFmTKv9EZ4Sc0horC2slFbj+NlMb8PDpVYkD54L74/dk
   FAcJts95n36u70wo4JFNRHvsQJ86clTb/IuQR0C7aSL6mlTmqHE5F27sK
   eoHOWm33D1BSBh4Z3YxK4oEJCt5d2OAXS8tV0REYNOKmfaFmp7y2O4Ez3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341548219"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341548219"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 17:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691719686"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="691719686"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2023 17:21:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmkiN-000YAS-0i;
	Thu, 13 Apr 2023 00:21:27 +0000
Date: Thu, 13 Apr 2023 08:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 1cafbd82c72826dd7107b19f91d6ac2f6ec8e07d
Message-ID: <64374ad6.htjNr1JRQfGF2Yih%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_172132_254535_87A8871C 
X-CRM114-Status: UNSURE (   5.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 1cafbd82c72826dd7107b19f91d6ac2f6ec8e07d  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 42
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
