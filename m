Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FCFC77B73
	for <ath10k@archiver.kernel.org>; Thu, 20 Apr 2023 03:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R05gFIjU0bYIDkIMU/Uh2FyeHd6G1xvMdBuqFFL9rCY=; b=cEIGDSvyrqumpA
	0OF5P+hPFwk+vBzQTiuSbzLrMOyZgYvkUc7yG8p4XeNBgBXCyw5xAH0FJNBxXMb0FO2DiKhzIoG9f
	lMJqfHeUWA4UBs38Qn3ug9DLW0w19RyClTWT6CXOCRSrj08uKnS9/WPDpMR5rIP37jEwYgqMhZRl5
	NZuhWjlfLf9E11Ituczqk/EBr36KHuVvLbCDXzxAYQg0xD8lGblxJnEpjA+47Hnfy2Xt3exwRWNxj
	b/YeZyTWmfN3HaFc92SlnjFYEb1YTMPl8z0vsY6TWThrfkRH3/XpXpEeSa5T4b/pRuFWVeRdR0gm/
	acB9WtPUiy6i0+RINSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppL8m-006xyl-1G;
	Thu, 20 Apr 2023 03:39:24 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppL8i-006xxT-2z
	for ath10k@lists.infradead.org;
	Thu, 20 Apr 2023 03:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681961960; x=1713497960;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=R21dWXexe8ndasae7hky8ugnbBRhjNxcYW6ELPKRV/4=;
  b=M+owvzfSeAiHAF++T6ZDpJLI9oytsy5JnUUrRRI6vG2uaL5cRJWXg4rG
   WbLm4W7sNfk0GLyCw1li0tVrP+AhO8IGtHxpDUlimuBIPy2OwS4EuPd+o
   s4JS8e2W1HtRljMK8bjEJX7t3p/wa1qo50NMK8sFz1/yoDw9Ffwq0Z744
   Jzv7SArSDE2Fr9cfYQRMNrPgw95HwxCNrygR1Ltw4nvLxWyMJ5LjAi/05
   u0pV3gEFpUFfE4KJLDEPVH4puaI9y+Jx8FJNNK2/I4Icfqp2439eWidA3
   1ksRWZQs/hslPgLWv5LnLuAgkHi6tp0Y0LcNCNsKVnOZ5SN9oAr0t6uey
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325232940"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="325232940"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669211428"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="669211428"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Apr 2023 20:39:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppL8b-000fQa-3A;
	Thu, 20 Apr 2023 03:39:13 +0000
Date: Thu, 20 Apr 2023 11:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 554e3b37c06876f50e064a6f11b367ef1d61f8ac
Message-ID: <6440b3bf.QwEA1JFovXA8iQ9n%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_203920_973288_00976B61 
X-CRM114-Status: UNSURE (   4.52  )
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
branch HEAD: 554e3b37c06876f50e064a6f11b367ef1d61f8ac  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 43
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
x86_64                            allnoconfig   gcc  
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
