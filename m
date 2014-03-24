Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS2Qe-00033K-GL
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 10:48:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: introduce rx_status htt template
References: <1395394437-4048-1-git-send-email-janusz.dziedzic@tieto.com>
 <87ior37vx1.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=peGOBr3_9zpiE73HMnOd3_WZqo00B+RtvaXSS0OH2MEQ@mail.gmail.com>
Date: Mon, 24 Mar 2014 12:47:46 +0200
In-Reply-To: <CALhHN=peGOBr3_9zpiE73HMnOd3_WZqo00B+RtvaXSS0OH2MEQ@mail.gmail.com>
 (Janusz Dziedzic's message of "Mon, 24 Mar 2014 11:16:54 +0100")
Message-ID: <87a9cf7u0d.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 24 March 2014 11:06, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>>
>>> Introduce rx_status htt template instead of
>>> stack version.
>>>
>>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>>
>> Why? What's the benefit from doing this?
>>
> This is the must in case we would like to report rssi + rates correctly.
> I describe this in 2/2 - maybe squash them?

Nah, better to keep them separated. But in patch 1 please document why
you are doing that, so that I (and others cherry picking ath10k patches)
don't need to guess. For example, you can say "in preparation for foo"
or something like that.

> Currently during heavy traffic we could have:
>> 10 packets with START_VALID - correct RSSI + rates
>> 10 packets with END_VALID
>> 10 packets with START_VALID - correct RSSI + rates
>> 10 packets with END_VALID -
> ...
>
> Because of that we have to store rssi + rates for case when END_VALID only.
> In other case when using monitor we will see:
> - 10 packets with correct rssi/rates
> - 10 packets with rssi=-95/rate=6Mbps

Ok, I understand now. Please document that in patch 2.

And in the future, please double check that your commit logs answer the
question "why?". That will save everyone's time :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
