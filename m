Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF0CC05027
	for <ath10k@archiver.kernel.org>; Tue, 14 Feb 2023 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8BalQyer9JAgef7sYQ0dwxCq+J2FIiDntm7q39hVoc=; b=sSykKrNA0oensm
	o3U1XWRX8yJXx2IhYFCBe7mH1tIxbpsH9D8OKYW+iDZ2kvcBO4Pxa4YzsgeK50PChnYAn/Q6nLdzf
	VKJ17e1xvtGSDUvdCH6JPhekd08dGz4TEacsQ0XM142s7SsarjpfcbDxh9dyC36xtfOBiXQK6tUed
	PCPK5ljxLu5k+f2eaEkSCvfRQOizBSMhH4pR9pqXHD+azCZEGsfiIa3WboFZzBx8936fy0YHxi0BW
	SA3vUbAP2/LQawVF6qNoNjIIUxsZ4kuYQl/hkqVcnSQeRJ5KtY/U5QPjD7xqXVzoig7X9R06EHnH4
	LPZF82CEJrnrmBOm/4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsGK-000v25-M2; Tue, 14 Feb 2023 10:10:12 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsGG-000v0H-FW
	for ath10k@lists.infradead.org; Tue, 14 Feb 2023 10:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676369408; x=1707905408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s0Lz7JUBBVg63XaoQ97SctTYeJ6EvLn3duSa5/kwusE=;
  b=eJ2DzK8G3UnQ14zSVQm+V6gUiRolAqRC+63MxFH3fn4YtXn62ZBkNTvN
   necmRvMS8VpgqOnuZ/9WnLcTO6dgBLsU/XANaLIAA83BU/GJFgZ1l6jbM
   wvDP98nPmlgpJbZiCYRGahD9CvlI6ye4GMJMbU2wQ3YJGD3pCa++wpWOe
   RCSB6tkWtKHB34wZxAcoPQiJUM0niQfhK8BMLz0jr47mAxEwOFgje/hek
   FaUCzsWJnefhFAIU2/yOGc1NdvbXzuwBNAVNw6CI2PHnb6DeZtK7s796v
   3JhPjvwe92TXOgJaWtIksBEk/cwSti8W2RlXG3uMHh6sWUydIIzpMXj/N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328836730"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="328836730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 02:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="646709341"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="646709341"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2023 02:10:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRsGA-0008OD-2b;
	Tue, 14 Feb 2023 10:10:02 +0000
Date: Tue, 14 Feb 2023 18:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 db54f3749d9a00c54b9a998e1b320bd337cc8bc1
Message-ID: <63eb5df1.tYMvLWOvReqTlWBT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_021008_609183_A43BD942 
X-CRM114-Status: UNSURE (   5.84  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: db54f3749d9a00c54b9a998e1b320bd337cc8bc1  ath6kl: minor fix for allocation size

elapsed time: 922m

configs tested: 42
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
