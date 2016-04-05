Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anQdQ-0002Zt-Bf
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 13:03:10 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix deadlock when peer cannot be created.
Date: Tue, 5 Apr 2016 13:02:43 +0000
Message-ID: <87k2kcb43y.fsf@kamboji.qca.qualcomm.com>
References: <1459379297-21496-1-git-send-email-greearb@candelatech.com>
 <CAGRGNgWEua3EOePQFRS_AR5BnSUPUhFrudWs2hY7YPLizxnyhQ@mail.gmail.com>
In-Reply-To: <CAGRGNgWEua3EOePQFRS_AR5BnSUPUhFrudWs2hY7YPLizxnyhQ@mail.gmail.com>	(Julian
 Calaby's message of "Thu, 31 Mar 2016 12:41:54 +1100")
Content-Language: en-US
Content-ID: <7A2B8D3F3E3F004A8FFFF1B2C4041504@qualcomm.com>
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
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Julian Calaby <julian.calaby@gmail.com> writes:

> On Thu, Mar 31, 2016 at 10:08 AM,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> We must not attempt to send WMI packets while dholding the data-lock,
>
> s/dholding/holding/ ?

I fixed it in the pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
