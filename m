Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlcH-0005ic-Po
 for ath10k@lists.infradead.org; Mon, 20 May 2019 16:58:27 +0000
Subject: Re: Problem with 9984 in routed mode with 512b frames.
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <2ef800e2-5ce6-f579-ded5-65dc82827e4d@newmedia-net.de>
 <cdfa7b09-4e32-a62d-1bb6-d6128ba6594b@candelatech.com>
 <eae17245-eec2-96fe-34ff-f3800fae44d8@newmedia-net.de>
 <CAJ-Vmo=xhBvLmzec5mzf-gcFm1h6cQBLUOdVhuQjvbUWFjP-AQ@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <24c966c0-2cd6-cdb0-c5dc-2f505eeb40ca@newmedia-net.de>
Date: Mon, 20 May 2019 18:58:04 +0200
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=xhBvLmzec5mzf-gcFm1h6cQBLUOdVhuQjvbUWFjP-AQ@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>


Am 17.05.2019 um 17:47 schrieb Adrian Chadd:
> On Fri, 17 May 2019 at 08:06, Sebastian Gottschall
> <s.gottschall@newmedia-net.de> wrote:
>
>
>> personally i think going back to basic rates like 2 mbit makes no sense
>> anyway. its that dead slow that a connection must break and has to be
>> broken if this doesnt work.
>> still a shame that beacons are still transmitted in this way and
>> multicast/broadcast packets as well which causes a hell of problems. but
>> thats for backward compatibility of cause
> It depends on what kind of channel you are. Not everyone is deploying
> super dense enterprise APs. :-)
>
> The 11ac and 11ax chips that do constant frequency readjusting work
> better in things like moving drones, where you have constant doppler
> shift. I know some people doing drone work that just don't bother with
> MCS and aggregation because they need a super reliable channel and the
> conditions constantly shift.
>
> That said, they're very sad that they can't hack on the 11ac/11ax
> firmware to fix some err, less optimal decisions in their use case
> space like they can with ath5k/ath9k.
>
> ISTR back at QCA days there were some people on the systems team that
> could demonstrate CCK was more stable in some use cases and so didn't
> like the Linux rate control behaviour of not falling back to CCK in 2G
> 11n mode. There was .. pushback against the linux upstream rate
> control in this respect right until the linux folk totally deprecated
> the QCA rate control in ath9k. :)
CCK is dead stable of cause, but also dead slow and its blocking the 
channel which decreases performance for all other people
>
> (And then bugs like what ben is seeing :)
>
> Ben - did disabling CCK/OFDM fallback rates help? Did you fix the bit
> that tries to send AMPDU frames in non-11n rates?
>
>
> -adrian
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
