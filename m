Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIka1-0005zN-AV
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 19:55:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Build failure in latest ath10k tree.
References: <530E3762.4030000@candelatech.com>
Date: Wed, 26 Feb 2014 21:55:18 +0200
In-Reply-To: <530E3762.4030000@candelatech.com> (Ben Greear's message of "Wed, 
 26 Feb 2014 10:50:10 -0800")
Message-ID: <87d2i9k5sp.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> Looks non-related to ath10k itself...maybe bad merge or
> upstream error?
>
> I'll dig into it in a bit if no one beats me to it.

[...]

>   CC      arch/x86/kernel/cpu/capflags.o
>   CC      arch/x86/kernel/cpu/common.o
> fixdep: error opening config file: /mnt/sda/home/greearb/git/linux.ath/include/linux/spinlokk_types.h: No such file or directory

Is it really "spinlokk" (not spinlock) or is that just a copy&paste
error?

FWIW I haven't noticed any build errors myself.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
