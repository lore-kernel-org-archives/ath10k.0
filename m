Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C62C77B76
	for <ath10k@archiver.kernel.org>; Mon, 17 Apr 2023 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eeAN//pbMe3ZfmG/M6ipo/Hi4VfPufZebB6rZyW23p0=; b=QvBdy8TxmahfpR
	bXNsC/fWE29tBtclkvMSyqf3WStN/IunBPGrSGO/Nl/LMzkTGzbXOBR8sM4iql3b2MNah9Trh/0PZ
	ySsbF49kihBgW0PbrrLnLHr5FiZbQdxLsXpqrXXYtyc9VIDCFwJtF1/FUGyu5r4n+kcaS/MEt/Rv7
	UgaQ6odWBL4mmyzhz7Ws8N9Fs0J7fJgFSP9o3yjyLQwbCmlWKfcuqPw5WrJPRA0Fb0oLY6J6mvX5p
	1Xdz1yF9vCHZmi4sgnXOVK76UdI+Y7TP7h+hkCzzQt8EDMioXw97Ji2m+bvzC0d0lv5/B2kML79es
	KLM95g5XAGi6fsDjjAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poY27-000N3B-2e;
	Mon, 17 Apr 2023 23:13:15 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poY25-000N2I-0l
	for ath10k@lists.infradead.org;
	Mon, 17 Apr 2023 23:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681773193; x=1713309193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=p5DaIf5vy8CvQOdZbFoQ1wXMYQw4JJKJvZzrUnEXa6A=;
  b=L/AcH+QraSm52PhVWtCgIoPj7vmQjoCHaAijCvxgkonbe7b23NzoFiK7
   q6P7bzFwus6zYsPDp/VwiJyu4vqIYkNfrmlaRbmNh7LeLnf8FiveIKA7/
   QRA/oCqv0EPc2lHn//D9QWykX7jEqtxES4nDNbtnlLKqt8L5w62T/Mvq7
   glO4LJ+XxBEJZEAJlRHY4jREpA9l5ku+x0sX6qK58BnX0cKQ09L3etjWV
   H1+HnhC1ZG9gKa9j2WNtDakrd5eqXDSFB8zkF9cvKCVwr8q8/xKh6rPzc
   9/afN2kHSji9LTkAziWIm88q3FWj2xc5s7lVgPbKBM6V931FnvsgTYT6y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407923971"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="407923971"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="755467569"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="755467569"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Apr 2023 16:13:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poY1y-000cjB-15;
	Mon, 17 Apr 2023 23:13:06 +0000
Date: Tue, 18 Apr 2023 07:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 2bfe392244b6c6f026482ff5937856651a5e0204
Message-ID: <643dd254.KQdD+waLTrMWAuAl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_161313_317910_67785695 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: 2bfe392244b6c6f026482ff5937856651a5e0204  Merge branch 'ath-next' into ath-qca

elapsed time: 730m

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
