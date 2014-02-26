Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIiJc-00009T-0M
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 17:30:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: improve rx path when play with attention flags
References: <1393312414-9404-1-git-send-email-janusz.dziedzic@tieto.com>
 <CA+BoTQkgFVgWGJTTLOJ2tiqqaJ=0O7JvGAMDWc8JHt0rJP92UA@mail.gmail.com>
Date: Wed, 26 Feb 2014 19:29:57 +0200
In-Reply-To: <CA+BoTQkgFVgWGJTTLOJ2tiqqaJ=0O7JvGAMDWc8JHt0rJP92UA@mail.gmail.com>
 (Michal Kazior's message of "Tue, 25 Feb 2014 08:24:49 +0100")
Message-ID: <871typlr3e.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 25 February 2014 08:13, Janusz Dziedzic <janusz.dziedzic@tieto.com> wrote:
>> Currently when we check attention flags we do __le32_to_cpu()
>> four times for each packet. This could have performance
>> impact for BIG endian platforms. This patch improve this
>> little bit.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

[...]

>> @@ -929,6 +873,9 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
>>                         struct sk_buff *msdu_head, *msdu_tail;
>>                         enum htt_rx_mpdu_status status;
>>                         int msdu_chaining;
>> +                       struct htt_rx_desc *rxd;
>> +                       u32 att_flags;
>> +
>
> No need for an empty line I suppose? I would also prefer `attention`
> instead of `att_flags`, but no big deal.

Yeah, attention is better.

And also the variable declarations should be in the beginning of
function. Apparently I have been sloppy missed that here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
