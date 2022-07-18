Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB701C433EF
	for <ath10k@archiver.kernel.org>; Mon, 18 Jul 2022 23:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=84QmN3kohC6cXU/Zv0bLzt1RSlApyk3qLv8w7g/Njfc=; b=VWjo4F9aSsx6Tz
	6T32eFQVv4Wg5GiUWiugTbI9ZMkOcbPbvdJV3MHtEpC/e/4VLodFIB97aaOC7RuAPGL8dWCDgdZlw
	6lzX1m4NdavDXi8MHysMZlw5cpI+3BxiRVPx3QRdn5T2qN96u4Kk9aw6D6c356D7ywhQPn8x+zHsr
	6czszq9ZhkFkQGKBf2nleo28OnrIpM+pWJEfKRFg2i0QhSl/3VCrGTItsxN0ukQ4RwdL/d5KcJSB3
	rikDsZWUM0ONJOcr+Q/ryQZGEWWQSQkUGPJa8vRqf3Zt+6lb6ziTLAyLVZwb4Pq5a86l7ZkzZWaQC
	61DoAqTjoB83l2NQywyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDaIX-002lfa-EA; Mon, 18 Jul 2022 23:37:09 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDaIU-002lex-87
	for ath10k@lists.infradead.org; Mon, 18 Jul 2022 23:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658187426; x=1689723426;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+A95qnkuT58eytm5P6gBQqTiWf0t9YvxolR9q3dgbDc=;
  b=MaUPAbywYqcVYhCQ8XoEC0pp/FC7RnuCQN+4lmPuJqhYUVjhSlUEg3pw
   R+yrlUCP25p9npSirc9a73FKVkZU/kTCwBDFDeXlbEZ5L0CHKCs2PNcCk
   hITRn1AvKjZMaS15GYR9l/xGOI8AqInPLUS8cbqWWGy7/XeCPtCf44DDG
   cRafNJGbSTQ6FbHQuXlPt8C/kcJ2wdN97qKDx01+muOiggc1e7nYRxNtT
   ZdAFCthTSzDl5NaB9JN8K9r0OQT20BZuVSk/kQ+elcXZUTPX0c3WnOOk+
   z6+gXTC38nFkEh3VRg2t469GSND1gQOIav2Hpx7UYgqWo4SVfutAaRzZX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="283908974"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="283908974"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 16:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="665198015"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jul 2022 16:37:03 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDaIR-0004ri-7N;
	Mon, 18 Jul 2022 23:37:03 +0000
Date: Tue, 19 Jul 2022 07:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f4e228410c4667dcbe32d06fba8dcb372210339f
Message-ID: <62d5ee7a.du+3smXPiiB4UIfK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_163706_364987_7B17C97A 
X-CRM114-Status: UNSURE (   7.24  )
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
branch HEAD: f4e228410c4667dcbe32d06fba8dcb372210339f  Merge branch 'ath-next' into ath-qca

elapsed time: 801m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a016-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a013-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a016-20220718
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220718
riscv                randconfig-r042-20220718
s390                 randconfig-r044-20220718
arc                  randconfig-r043-20220717
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                 randconfig-a003-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a006-20220718
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718
hexagon              randconfig-r041-20220717
hexagon              randconfig-r045-20220717
riscv                randconfig-r042-20220717
s390                 randconfig-r044-20220717

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
