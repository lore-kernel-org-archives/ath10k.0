Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22f.google.com ([2607:f8b0:400c:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1t3m-0006Q4-8g
 for ath10k@lists.infradead.org; Tue, 01 Jul 2014 08:05:03 +0000
Received: by mail-ve0-f175.google.com with SMTP id jx11so9184908veb.6
 for <ath10k@lists.infradead.org>; Tue, 01 Jul 2014 01:04:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnAVooNEHZbmqaudUpoCGCzSi-nWM8xarwqv+mLq14Dcw@mail.gmail.com>
References: <CAEFj984N4HSVosxx52s9e-sX3STK=YjOmh_UUwJWDJRQZAZdcg@mail.gmail.com>
 <CA+BoTQnAVooNEHZbmqaudUpoCGCzSi-nWM8xarwqv+mLq14Dcw@mail.gmail.com>
Date: Tue, 1 Jul 2014 16:04:40 +0800
Message-ID: <CAEFj984+jp4L3x0W2euEPsUbq9QsbDid0h0iTrTu36LHZh-URw@mail.gmail.com>
Subject: Re: Frame Injection in Monitor Mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Jul 1, 2014 at 3:29 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 1 July 2014 09:17, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> Hi, all
>>
>> Anyone has tried the frame injection using the standalone monitor mode
>> on AP firmware.
>>
>> I have tried this but no luck not working.
>
> I played with this a little a while ago.
>
> Raw tx on 10.1.467 is broken. It needs htt tx command to be modified
> to send a fixed up msdu len (msdu->len -
> ieee80211_hdrlen(hdr->frame_control) + sizeof(struct ethhdr) if my

So with this msdu->len, it means that there is no 802.11 MAC header in
the frame submission for transmission, and only Ethernet header. So
the transmit mode is ATH10K_HW_TXRX_ETHERNET, am I right?

Please advice. Thanks

Regards,
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
