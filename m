Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRf5J-0004yr-L0
 for ath10k@lists.infradead.org; Fri, 17 May 2019 15:47:51 +0000
Received: by mail-wm1-f47.google.com with SMTP id i3so7393702wml.4
 for <ath10k@lists.infradead.org>; Fri, 17 May 2019 08:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <2ef800e2-5ce6-f579-ded5-65dc82827e4d@newmedia-net.de>
 <cdfa7b09-4e32-a62d-1bb6-d6128ba6594b@candelatech.com>
 <eae17245-eec2-96fe-34ff-f3800fae44d8@newmedia-net.de>
In-Reply-To: <eae17245-eec2-96fe-34ff-f3800fae44d8@newmedia-net.de>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 17 May 2019 08:47:35 -0700
Message-ID: <CAJ-Vmo=xhBvLmzec5mzf-gcFm1h6cQBLUOdVhuQjvbUWFjP-AQ@mail.gmail.com>
Subject: Re: Problem with 9984 in routed mode with 512b frames.
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: ath10k <ath10k@lists.infradead.org>

On Fri, 17 May 2019 at 08:06, Sebastian Gottschall
<s.gottschall@newmedia-net.de> wrote:


> personally i think going back to basic rates like 2 mbit makes no sense
> anyway. its that dead slow that a connection must break and has to be
> broken if this doesnt work.
> still a shame that beacons are still transmitted in this way and
> multicast/broadcast packets as well which causes a hell of problems. but
> thats for backward compatibility of cause

It depends on what kind of channel you are. Not everyone is deploying
super dense enterprise APs. :-)

The 11ac and 11ax chips that do constant frequency readjusting work
better in things like moving drones, where you have constant doppler
shift. I know some people doing drone work that just don't bother with
MCS and aggregation because they need a super reliable channel and the
conditions constantly shift.

That said, they're very sad that they can't hack on the 11ac/11ax
firmware to fix some err, less optimal decisions in their use case
space like they can with ath5k/ath9k.

ISTR back at QCA days there were some people on the systems team that
could demonstrate CCK was more stable in some use cases and so didn't
like the Linux rate control behaviour of not falling back to CCK in 2G
11n mode. There was .. pushback against the linux upstream rate
control in this respect right until the linux folk totally deprecated
the QCA rate control in ath9k. :)

(And then bugs like what ben is seeing :)

Ben - did disabling CCK/OFDM fallback rates help? Did you fix the bit
that tries to send AMPDU frames in non-11n rates?


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
