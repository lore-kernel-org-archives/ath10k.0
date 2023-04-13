Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5DEC7619A
	for <ath10k@archiver.kernel.org>; Thu, 13 Apr 2023 00:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0j2BpXXA6y/oAsifbKRvZvwVcN5yu/3/wWyWPDYq/Ds=; b=WeBGMIPT+yIGVN
	oJLhUfr0lh/6e3BSn56WFuIMxMafsDh3QxT2YYdimNyJm2KI1nYKgKmvmodJHv/ixwKDzJm1bYKRW
	AiO56HN/j2IuyRb6Eb5AsrL9TUgm2ZuhjjWOBSuJCLfshmsE2Y7HMmV9bt4s5cVE5mvSBhlLW3n15
	RplXMY6TIfjm2iEHioZucg4imQiPk/74HBzJSZzDMFl1Jb1e7z9fsVPAt5LuoGTbTdXP3s3QU0i+c
	Kkg4hLnpO4F2MvUXg07/agPf3+OlBGDzzeDlZs8NgwiDTfrIxQA8Wa+OD4vK90fUAqkGwFHO9e3LL
	ledIA+cidFTuuvMqGlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkhU-004gpv-2e;
	Thu, 13 Apr 2023 00:20:32 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkhS-004gp0-1V
	for ath10k@lists.infradead.org;
	Thu, 13 Apr 2023 00:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681345230; x=1712881230;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=URXwnbtotdwDF6hd170eRmZeLYZVQzUZ5hikS8C8nJc=;
  b=blrGAvBZUIT+KFzRu58+V7XcqFeqv0OHJrInhYZDGZNDQPC265mHZUTU
   CisVqTZiM11jRAKrwVjh6OeN8eGk0M8W+MsqUdgTC43YzFPDHGru/6QbN
   nmHUhDGJaDaLsblC/XIuRUSoCqTXJLAyh4rkM8UJreBSAeGWx0iA1Njdv
   D8lACARgcSzYQgQWWQ08rdwzfhu3tAhRklSJwuJjGqrHXU+42EXK/yWIf
   SwlXZMZYAc1Tylhl09cAddcpM+6UNNPMT3DZAj7ssrtJ8gOvMtCIXk1ab
   f1dhR5LqwpZGjumjFRIge4ASB12qO9s7umizG5AUZxzdEsO7LzNvOLUnw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371905041"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="371905041"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 17:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935321103"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="935321103"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2023 17:20:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmkhP-000YA4-08;
	Thu, 13 Apr 2023 00:20:27 +0000
Date: Thu, 13 Apr 2023 08:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 29873663e6e7c860ec199677607bc2f843faf699
Message-ID: <64374ac5.XBFsUR8EX7hS65g8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_172030_521304_48885A6F 
X-CRM114-Status: UNSURE (   5.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 29873663e6e7c860ec199677607bc2f843faf699  Merge branch 'ath-next' into ath-qca

elapsed time: 723m

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
