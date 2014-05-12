Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjqwN-0007wj-EB
 for ath10k@lists.infradead.org; Mon, 12 May 2014 14:10:52 +0000
Message-ID: <5370D655.4090206@candelatech.com>
Date: Mon, 12 May 2014 07:10:29 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
In-Reply-To: <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 05/12/2014 01:21 AM, Avery Pennarun wrote:
> On Mon, May 12, 2014 at 3:07 AM, Avery Pennarun <apenwarr@gmail.com> wrote:
>> On Mon, May 12, 2014 at 1:05 AM, Ben Greear <greearb@candelatech.com> wrote:
>>> If it's getting on the air, then I think the only way to figure out
>>> what is wrong is to decode the packets and see if they are encrypted
>>> properly or not.  I think there is a way to get wireshark to decode
>>> pkts by feeding it the proper keys, but I have not ever actually tried
>>> doing that.
>>
>> Okay, here is a fairly reduced capture of my wireshark trace:
>> http://apenwarr.ca/tmp/ath10k-utorrent-dropout-v2-reduced.pcapng.gz
>> [...]
> 
> From what I can see, the most suspicious part of this trace is an
> 802.11 Action - Add Block Ack Request at time 181.1456.  In a longer
> version of this trace, I can see these occurring sporadically.  Each
> one has a different TI field:
> 
> Time 8.367: TID=0
> Time 9.609: TID=6
> Time 156.188: TID=1
> Time 178.076: TID=2
> Time 181.145: TID=3  <-- almost exactly the time of the failure
> Time 190.127: TID=5
> 
> I don't know how 802.11 QoS works, but I don't think it makes sense to
> keep negotiating block ack policies with different TIDs.  Also, the
> Block Ack Starting Sequence Number field is always zero; I don't know
> what that does, but it seems weird to me.

I'm afraid I don't know much about blockack either.  I did fix an assert
and use-after-free bug in blockack code in my firmware (though, possibly
the use-after-free was introduced by my earlier assert fix), and possibly
neither of these fixes are needed in .467 firmware, as I was first developing
on earlier firmware.

I think my blockack fixes only applied to bringing stations up
and down, so probably not related to your issue.

Hopefully someone that knows more about BA can comment on your
trace.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
