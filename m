Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmUjl-0005cU-Jm
 for ath10k@lists.infradead.org; Mon, 19 May 2014 21:04:46 +0000
Received: by mail-qg0-f53.google.com with SMTP id f51so9739400qge.12
 for <ath10k@lists.infradead.org>; Mon, 19 May 2014 14:04:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-1byQ+UHmREP5+RtikWDj-0wFbDPdPcO+HL0HnH+eDdig@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
 <CAHqTa-3gn1N8hTW4rpMos+h+K4nafoEsv94P0=0O3=Dpiaf2oA@mail.gmail.com>
 <CAA93jw6-Vu5=ySa1Oi6WO1BEo8cuAnKP3FJNJD1P=dEj_-9D3A@mail.gmail.com>
 <CAHqTa-1byQ+UHmREP5+RtikWDj-0wFbDPdPcO+HL0HnH+eDdig@mail.gmail.com>
Date: Mon, 19 May 2014 14:04:23 -0700
Message-ID: <CAJ-Vmo=ODZMM5KRSNC087MqgHBwHT6r1AK49+i3dtJrUtoAi=g@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
From: Adrian Chadd <adrian@freebsd.org>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

Hi,

Bumping this up.

Please don't let us forget. once I get access to the firmware source
from Ben and QCA I'll do a hell of a lot more digging.

Thanks,



-a


On 14 May 2014 23:12, Avery Pennarun <apenwarr@gmail.com> wrote:
> On Wed, May 14, 2014 at 3:26 PM, Dave Taht <dave.taht@gmail.com> wrote:
>> On Wed, May 14, 2014 at 12:07 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
>>> but meanwhile, I think I'm in a
>>> big hurry so I probably want to just rip out all support for mapping
>>> diffserv to QoS on the ath10k transmit side.  Does anyone have any
>>> suggestions on where to look for my hack-and-slash operation?
>>
>> Tis easy to hack and slash it out of cfg80211_classify8021d in
>> net/wireless/util.c
>>
>> Recently someone added a direct mapping from vlan priorities to wifi
>> queues here - which is stupid, as the VO queue does not behave
>> anything like the equivalent vlan priority queue does. I'd like to see
>> that removed or mapped properly, also.
>
> Yup, replaced this function with 'return 0' and my problems are gone.
> (Well okay, this problem is gone, and you're probably not interested
> in my personal problems. :))
>
> Obviously just completely disabling QoS multiple queues is not the
> right long term fix, but as Dave pointed out, it wasn't clear the code
> there was exactly what we want anyway, so I won't feel too guilty
> about it.  Meanwhile, hopefully someone with deeper knowledge than me
> can figure out what's with the IVs.
>
> Thanks!
>
> Avery
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
