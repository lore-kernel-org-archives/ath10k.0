Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt94R-0001kX-EL
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 05:53:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: Fix shared WEP
References: <1416796657-24657-1-git-send-email-sujith@msujith.org>
 <1416796657-24657-2-git-send-email-sujith@msujith.org>
 <87lhn0639s.fsf@kamboji.qca.qualcomm.com>
 <21620.5017.657509.251220@gargle.gargle.HOWL>
Date: Tue, 25 Nov 2014 07:53:12 +0200
In-Reply-To: <21620.5017.657509.251220@gargle.gargle.HOWL> (Sujith Manoharan's
 message of "Tue, 25 Nov 2014 10:58:57 +0530")
Message-ID: <87y4qz3jxz.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> Kalle Valo wrote:
>> No magic numbers, please. I didn't find anything for IV internals from
>> ieee80211.h, not sure if we should add them there or just use ath10k
>> internal defines.
>
> We are just retrieving the keyidx from the IV - not sure adding a couple
> of macros for "6" and "3" will make any difference.

It won't make a difference for you but it will for someone else reading
that part of code.

keyidx = skb->data[hdrlen + WEP_HDR_IV_LEN] >> WEP_HDR_KEY_ID_LSB;

versus:

keyidx = skb->data[hdrlen + 3] >> 6;

(I didn't check the standard so tha names can be totally wrong.)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
