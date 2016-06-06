Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b9yJK-0005We-5N
 for ath10k@lists.infradead.org; Mon, 06 Jun 2016 17:27:34 +0000
Subject: Re: Any tips on where per-packet antenna selection could be pushed?
References: <CAOiRWuVxbGDoVtxahwRxyH9NaBB9LmaEBZ5bzgSPEf=Eu1g=ug@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5755B0FF.9010900@candelatech.com>
Date: Mon, 6 Jun 2016 10:21:03 -0700
MIME-Version: 1.0
In-Reply-To: <CAOiRWuVxbGDoVtxahwRxyH9NaBB9LmaEBZ5bzgSPEf=Eu1g=ug@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Zach Sherin <zach@netblazr.com>, ath10k@lists.infradead.org

On 06/06/2016 10:12 AM, Zach Sherin wrote:
> Hi all,
>
> I'm working on a device with antenna selection, similar to the ideas
> behind Ruckus or Google's Onhub router. I've been looking into a
> solution for per-packet antenna selection (based on destination/next
> hop). I was hoping this list might be able to suggest where I should
> investigate adding that switching code. My switches are currently USB
> RF switches, but I'm going to be using some serial protocol for the
> final version (we don't have much to switch, and it should be a single
> byte per packet).
>
> The last suggestion I received was to emulate Netsed [1] by routing
> all packets through a specific socket, running antenna selection, and
> then pushing them to their final destinations.
>
> I assumed that the best place to do antenna selection would be within
> ath10k itself (my devices all run on ath10k) so that I could introduce
> the minimum possible latency with antenna selection. Should I be
> looking at a different part of the networking stack?
>
> Does anyone have any suggestions, or perhaps an open-source project
> out there already trying to do antenna selection?

Would per-peer antenna selection work?  That is probably more easily
hacked into the firmware (I don't think stock firmware supports this
feature, but I could be wrong.)

Thanks,
Ben

>
> Thanks,
> Zach
>
>
> [1] http://silicone.homelinux.org/projects/netsed/
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
