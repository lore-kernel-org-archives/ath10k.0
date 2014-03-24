Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS1wW-000267-Fo
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 10:17:21 +0000
Received: by mail-lb0-f177.google.com with SMTP id z11so3409616lbi.22
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 03:16:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ior37vx1.fsf@kamboji.qca.qualcomm.com>
References: <1395394437-4048-1-git-send-email-janusz.dziedzic@tieto.com>
 <87ior37vx1.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 24 Mar 2014 11:16:54 +0100
Message-ID: <CALhHN=peGOBr3_9zpiE73HMnOd3_WZqo00B+RtvaXSS0OH2MEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: introduce rx_status htt template
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 24 March 2014 11:06, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Introduce rx_status htt template instead of
>> stack version.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> Why? What's the benefit from doing this?
>
This is the must in case we would like to report rssi + rates correctly.
I describe this in 2/2 - maybe squash them?
Currently during heavy traffic we could have:
> 10 packets with START_VALID - correct RSSI + rates
> 10 packets with END_VALID
> 10 packets with START_VALID - correct RSSI + rates
> 10 packets with END_VALID -
...

Because of that we have to store rssi + rates for case when END_VALID only.
In other case when using monitor we will see:
- 10 packets with correct rssi/rates
- 10 packets with rssi=-95/rate=6Mbps

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
