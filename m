Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C3C6FA8E
	for <ath10k@archiver.kernel.org>; Sat, 25 Feb 2023 03:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KTTYyHU7KGrTNdUODb+Q5hxBniswo//6z/bTaWevrU=; b=CZuJm+JojbKzL5
	ClbOK72dJJyaj1NGG8uB74IJ8t9E4kMwLh6b34p2/V+nv0KTDPPmEBGncrfD4JLp/VZ5plsYOsb69
	TRwdShbybYkNi8sEKxHTf91V1rYU7KwHmQ6gcssFy1im2+rJOVK5QQU21gf2oRZuH8k0IK+Gi0Sy9
	M1h4y7+Ms/KAgSisgh7E9lpT4Jr7F+01McPtAdNwzgarMtXjD1m4CUFYFG6lRlaZBqHCtYnOUNHLX
	Aw6i2MDF0wJorPWZ1xPuS1FfHvHXPnB7E++6aDXvHW1KXxN+fZ2vu3FKMQHb/qJ218lmKs2XVzrew
	4KnS4QLsFwQfvbjw27TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVlNE-004kJn-1b; Sat, 25 Feb 2023 03:37:24 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVlNA-004kIo-Hr
	for ath10k@lists.infradead.org; Sat, 25 Feb 2023 03:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677296240; x=1708832240;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CAMuVsoH8TLYnPItmJJYqQ3I79DqzEYe2YflMPS2A2Q=;
  b=cSZDUaBLzFBIimVAt7jlqSEwTapybHVMVd7ek+BFiibiT3mnj5DKd81O
   eA8Dl4/q8wYkZ5HbmK3trxHZYu1Tto/2V40UbTQuzXVzKOaHNqdj/Phxk
   VYaIovspmEw+ryOQdj4oadbPRbReLycBWLVYEG5hAyCOmAEJUN4I4lFOi
   b3svZntCDDsdjM2NYm/wzf1oFA0DWEtTbzD7k/J4DeJ2pOpKlTSobCaQZ
   qRyzFbjCfgAi7RtWfQedatBZtpj1bV1JIiXccXJnVCKJ8hCax097bY6jA
   Ya9SggfNFRg/MIGhtCa9kMRePr7ZO5EgHphRgrTp7y3FzxM36OmRCcLSZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335061097"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="335061097"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 19:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782597157"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="782597157"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 19:37:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVlN5-0002sp-1x;
	Sat, 25 Feb 2023 03:37:15 +0000
Date: Sat, 25 Feb 2023 11:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 19e6da7ff3adb6c3185a4f8bf3d7352d903afa4d
Message-ID: <63f98249.KSoOEvi+q6+SasUc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_193720_722909_AB1D6E9F 
X-CRM114-Status: UNSURE (   6.37  )
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
branch HEAD: 19e6da7ff3adb6c3185a4f8bf3d7352d903afa4d  Merge branch 'pending' into master-pending

elapsed time: 723m

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
