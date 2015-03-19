Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYW7M-0007nA-Ru
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 08:47:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: enable ANI by default
References: <1426701700-21974-1-git-send-email-arnagara@qti.qualcomm.com>
 <874mphl6jc.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 19 Mar 2015 10:47:22 +0200
In-Reply-To: <874mphl6jc.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Thu, 19 Mar 2015 10:45:27 +0200")
Message-ID: <87zj79jrvp.fsf@kamboji.qca.qualcomm.com>
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Ashok Raj Nagarajan <arnagara@qti.qualcomm.com> writes:
>
>> ANI is currently not enabled by default. Enable this feature by default.
>>
>> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
>
> You did not send this to ath10k list (and CC linux-wireless). Check the
> instructions here:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/sources#submitting_patches
>
> Also the commit log doesn't tell anything. What is ANI and why should it
> be enabled? What bug does this fix (if any)? How will the user see the
> difference after this patch is applied?
>
> As a rule of thumb, the commit log should tell any engineer (even one
> who is not familiar with ath10k) how the behaviour changes after the
> patch is applied. Think of your target group being distro maintainers,
> ath10k users, kernel subsystem maintainers etc. No company internal
> jargon or anything like that, write in plain english so that everyone
> understand.

I also forgot to CC ath10k list.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
