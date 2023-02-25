Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E0AC7EE2E
	for <ath10k@archiver.kernel.org>; Sat, 25 Feb 2023 00:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x6fRe9mRLJWoihnYdmdatI0l+G4N6tu7JF8rOd5U7sg=; b=44FC9ZqcNuv70o
	dbtnWNsRzNJc4imUaBR0UNtmeQud0DTc2K04jssAq1OsGZ71pC+PZrTElylwt2sxNqQBC6Da/ELO0
	f+jtHxYnmWQZC6eKQnuwXIpMSk1o0BNiFOPWI2LD4pVAysYtQUv+OA56Z8rtIxAvl/vz7sUwS4RNU
	8HSB3eBwDnvMAaPJ3khION6sw5HPlTO/Oq3Oh1lrLPTsXgH56+AM9WB70N3DJNrLwP1b86MCSQ5b4
	GcjH83A7m5ZsYfA7uSTjRBrLPKKmxMWG98iKEXDFmD5soUvDXUgVKQk9aut5fWcFt1yW27LAD1Ba/
	WUpZu9+HW7Ad2Wd/wrog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVila-004SwS-Jc; Sat, 25 Feb 2023 00:50:22 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVilX-004SvY-Pr
	for ath10k@lists.infradead.org; Sat, 25 Feb 2023 00:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677286219; x=1708822219;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wY0Rbt6rJgNKgQN1Epga0tM4sMkdHNjvt3dXSzedIIE=;
  b=BTxWt1mtTyRqKZmHvtOFXh9HJ4UDr6zpoULX5xI8N0yQPRF82Fad/hNX
   J92H7q0G7OJ4P0gwva+Ul/ORLQPR0SOkCG9KSVDlWFmEI0qtAqGSsxcDK
   9zrzkohzj2HnFqYWXuX9oKP9riFQM6K0eHBTUPWjNsmG14tmhRrkJOkOP
   L3kKD1eFRhBWprmn9zsaO3y4/n3YYUwJhTTiaKPzAsN6e8Rl0wtLDw8tv
   Bc/bi9GSMWCJASMWK2yQRAaBrvscLWQJd/nyKk1VJWlnLzEvQKEC3a/3s
   P0J12ogGpV6lUqVeMh/av0+PUcjy2SqZglRfkfvhNVHNBx+IzYMw9A1Cn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361121101"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="361121101"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 16:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="796911544"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="796911544"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2023 16:50:12 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVilP-0002pH-2x;
	Sat, 25 Feb 2023 00:50:11 +0000
Date: Sat, 25 Feb 2023 08:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 b5cf634b3f36831a05f555dbdf3ec9e07d0f22c3
Message-ID: <63f95b0c.UBcLfqh/l0vnq+ID%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_165019_916286_898719C9 
X-CRM114-Status: UNSURE (   5.86  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: b5cf634b3f36831a05f555dbdf3ec9e07d0f22c3  Add localversion-wireless-testing-ath

elapsed time: 839m

configs tested: 19
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
clang                                   alpha   defconfig
gcc                                       arc   defconfig
gcc                                       arm   defconfig
gcc                                     arm64   defconfig
gcc                                      csky   defconfig
gcc                                      i386   defconfig
gcc                                      ia64   defconfig
gcc                                 loongarch   defconfig
gcc                                      m68k   defconfig
gcc                                     nios2   defconfig
gcc                                    parisc   defconfig
gcc                                  parisc64   defconfig
gcc                                     riscv   defconfig
gcc                                     riscv   rv32_defconfig
gcc                                      s390   defconfig
gcc                                     sparc   defconfig
gcc                                        um   i386_defconfig
gcc                                        um   x86_64_defconfig
gcc                                    x86_64   defconfig
gcc                                                  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
