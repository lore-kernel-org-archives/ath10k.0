Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSLyS-0000xq-Gh
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 07:40:41 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Compilation backport ath10k
References: <EE97821C81277E459BEA5C6384C6F241012D6BF72CC8@srvexch01.SODIELEC.local>
Date: Tue, 25 Mar 2014 09:40:05 +0200
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012D6BF72CC8@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Mon, 24 Mar 2014 18:00:58 +0100")
Message-ID: <87lhvy3ewa.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> Hello everyone,
> I try to compile ath10k on the linux 3.2.36 but it only build 2 modules cfg80211.ko and compat.ko. After compiling I don't have 4 other modules of ath (mac80211.ko, ath.ko, ath10k_core.ko, ath10k_pci.ko)
> although when I look in the file .config before compiling all the variables are activated:
> CPTCFG_ATH10K=m
> CPTCFG_ATH10K_PCI=m
> CPTCFG_ATH10K_DEBUG=y
> CPTCFG_ATH10K_DEBUGFS=y
>
> My command to compile is: 
> make ARCH=arm CROSS_COMPILE=/home/alberix2/Cross-Compiler/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- KLIB=/home/alberix2/Desktop/linux-3.2.36_2013_Q1.0p2/ KLIB_BUILD=/home/alberix2/Desktop/linux-3.2.36_2013_Q1.0p2/ -j 10
> But there are some warning during the compilation: (you can view from my screen shot)
> And after the compilation, I look the file  .config there are no more variable above (they disappear, i don't know whether it's is activated any more), if i redo: make defconfig-ath10k then the file.config is renewable like before.
> Does any have any ideas about my problem?

I don't have a crystal ball so it's difficult for me to comment
anything. To get help please provide full information what you did, what
backports release you used, all commands you executed etc. And use this
for reference:

http://wireless.kernel.org/en/users/Drivers/ath10k/backports#ath10k_backports_releases

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
