Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIjYv-00037K-Mo
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 18:50:34 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1QIoAcB013252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 10:50:10 -0800
Message-ID: <530E3762.4030000@candelatech.com>
Date: Wed, 26 Feb 2014 10:50:10 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Build failure in latest ath10k tree.
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

Looks non-related to ath10k itself...maybe bad merge or
upstream error?

I'll dig into it in a bit if no one beats me to it.

[greearb@ben-dt2 linux-ath.x64]$ make  bzImage modules
make[3]: Nothing to be done for `all'.
make[3]: Nothing to be done for `relocs'.
  CHK     include/config/kernel.release
  Using /mnt/sda/home/greearb/git/linux.ath as source for kernel
  GEN     /home/greearb/kernel/2.6/linux-ath.x64/Makefile
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    /mnt/sda/home/greearb/git/linux.ath/scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      arch/x86/kernel/cpu/capflags.o
  CC      arch/x86/kernel/cpu/common.o
fixdep: error opening config file: /mnt/sda/home/greearb/git/linux.ath/include/linux/spinlokk_types.h: No such file or directory
make[5]: *** [arch/x86/kernel/cpu/common.o] Error 2
make[4]: *** [arch/x86/kernel/cpu] Error 2
make[3]: *** [arch/x86/kernel] Error 2
make[2]: *** [arch/x86] Error 2
make[1]: *** [sub-make] Error 2
make: *** [all] Error 2


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
