Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMChp-0003fO-1a
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 09:06:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [ath6kl:ath-next-test 47/51]
 drivers/net/wireless/ath/ath10k/debug.c:169:5-8: Unneeded variable: "ret".
 Return "0" on line 178
References: <53fbf631.S4reREVxRQQKt8Ff%fengguang.wu@intel.com>
 <alpine.DEB.2.10.1408260856130.2436@hadrien>
Date: Tue, 26 Aug 2014 12:05:52 +0300
In-Reply-To: <alpine.DEB.2.10.1408260856130.2436@hadrien> (Julia Lawall's
 message of "Tue, 26 Aug 2014 08:59:15 +0200 (CEST)")
Message-ID: <87iolf39jj.fsf@kamboji.qca.qualcomm.com>
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
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: ath10k@lists.infradead.org, kbuild@01.org, kbuild test robot <fengguang.wu@intel.com>, michal.kazior@tieto.com, dan.carpenter@oracle.com

+ ath10k@lists.infradead.org

Julia Lawall <julia.lawall@lip6.fr> writes:

> On Tue, 26 Aug 2014, kbuild test robot wrote:
>
>> tree:   git://github.com/kvalo/ath ath-next-test
>> head:   077256daf111b4db074ac602bed1e96e95e3a4a4
>> commit: 6b7b27b12f4af628305940c1c083b8558d7618ac [47/51] ath10k: improve logging to include dev id
>> :::::: branch date: 16 hours ago
>> :::::: commit date: 16 hours ago
>>
>> >> drivers/net/wireless/ath/ath10k/debug.c:169:5-8: Unneeded variable: "ret". Return "0" on line 178
>>
>> Please consider folding the attached diff :-)
>
> The variable is indeed not needed.  I guess the function returns a value
> for parallelism with ath10k_err.  But the function dev_err used in that
> function returns a value, while the macro dev_warn_ratelimited used in
> this function does not.

Ok. If it's ok for Michal I'll fold the patch before I commit it.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
