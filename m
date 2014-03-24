Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS851-0005ca-LR
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 16:50:32 +0000
Message-ID: <53306239.2020006@candelatech.com>
Date: Mon, 24 Mar 2014 09:50:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: Add debugging for tx-credits usage.
References: <1395428150-31996-1-git-send-email-greearb@candelatech.com>
 <871txr7svw.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmquq7dXTV0sSV1mJ0+8-9OuiCnqz2iN8VNO4J3iaeexQ@mail.gmail.com>
In-Reply-To: <CA+BoTQmquq7dXTV0sSV1mJ0+8-9OuiCnqz2iN8VNO4J3iaeexQ@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/24/2014 04:21 AM, Michal Kazior wrote:
> On 24 March 2014 12:12, Kalle Valo <kvalo@qca.qualcomm.com> wrote:

>>> -     status = ath10k_htc_send(htc, ATH10K_HTC_EP_0, skb);
>>> +     status = ath10k_htc_send(htc, ATH10K_HTC_EP_0, skb, __LINE__);
>>
>> Using line numbers in debug messages is very cumbersome. Some people
>> cherry pick patches, have their own changes and whatnot which will make
>> it more difficult to read the debug logs. Isn't there any better way to
>> do this?
> 
> I would prefer to explicitly wait for tx credit replenishment in
> ath10k_wmi_cmd_send() after a command is sent instead of all these
> prints. This way you can get a full call trace if it times out.

Would that be a performance problem (by effectively allowing only a single
item to be sent to the firmware at any given time?)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
