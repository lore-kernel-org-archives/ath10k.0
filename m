Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22d.google.com ([2607:f8b0:400c:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvstZ-0001Sb-Vq
 for ath10k@lists.infradead.org; Sat, 14 Jun 2014 18:41:42 +0000
Received: by mail-ve0-f173.google.com with SMTP id db11so4552851veb.4
 for <ath10k@lists.infradead.org>; Sat, 14 Jun 2014 11:41:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sat, 14 Jun 2014 14:40:59 -0400
Message-ID: <CAHqTa-1MGGFK50sO=JAswMZLA0=Yy8AH4g0ziLr6+RK2R57jFg@mail.gmail.com>
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
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
Cc: ath10k <ath10k@lists.infradead.org>

On Sat, Jun 14, 2014 at 12:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> We are experiencing a relatively-rare-but-not-rare-enough case which
>> has approximately these steps:
>>
>> - run a wifi AP for a while with a station or two connected
>> - shut down hostapd (stations all get disconnected of course)
>> - restart hostapd (perhaps on another channel or with different settings)
>>
>> After that, an external wifi sniffer can see beacons being transmitted
>> by the AP as expected, but all packets from stations trying to connect
>> are ignored.
>
> Do you have any guesses how often this happens? Once a day, once a week?

Someone in our QA group seems to be able to produce it after two or
three test runs with Veriwave.  Before each run, he stops and restarts
hostapd.

I don't think it happens very often at all if you stop and restart
hostapd.  I know it doesn't happen if you "only" stop and restart
hostapd, because I would have been able to easily reproduce that.  So
I think something particular has to happen during the session, then
when you restart hostapd the bug triggers.

I'm still looking so I can answer Michal's questions from earlier.  I
don't want to give incorrect answers :)

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
