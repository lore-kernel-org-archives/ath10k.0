Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from h-66-167-227-145.lsan.ca.dynamic.globalcapacity.com
 ([66.167.227.145] helo=mail.lang.hm)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOvXB-0001bf-Op
 for ath10k@lists.infradead.org; Tue, 20 Nov 2018 02:13:03 +0000
Date: Mon, 19 Nov 2018 18:12:29 -0800 (PST)
From: David Lang <david@lang.hm>
Subject: Re: [Make-wifi-fast] [PATCH v3 3/6] mac80211: Add airtime accounting
 and scheduling to TXQs
In-Reply-To: <CAA93jw55KywLAMEo=hHcqGdB1-qV3-3CCQe+T6GMNZwR6kRhJw@mail.gmail.com>
Message-ID: <nycvar.QRO.7.76.6.1811191811080.7093@qynat-yncgbc>
References: <1542063113-22438-1-git-send-email-rmanohar@codeaurora.org>
 <1542063113-22438-4-git-send-email-rmanohar@codeaurora.org>
 <e5344cad-2a18-a938-f2ed-43870027251c@nbd.name> <871s7nv9pl.fsf@toke.dk>
 <8e7847ff-4c88-10ae-2223-2fc7321641d9@nbd.name>
 <87sh02tfsp.fsf@toke.dk> <878t1p2bqz.fsf@taht.net> <87muq4sn50.fsf@toke.dk>
 <4DD985B6-7DBE-42F8-AC87-D6B40CEAE553@superduper.net>
 <CAA93jw4Cih5HkHYUOy7Vr5G7zi0KkKmNnNohDAVaj65goWOh+A@mail.gmail.com>
 <b0662c97-fb17-3f9d-693e-2fec92535076@candelatech.com>
 <CAA93jw5tgKcRM9x0gd-7SKf=qBbjhSip64e1oQqUB6N67FhdmA@mail.gmail.com>
 <6beaeb84-b705-335b-93a7-36176495099b@candelatech.com>
 <CAA93jw55KywLAMEo=hHcqGdB1-qV3-3CCQe+T6GMNZwR6kRhJw@mail.gmail.com>
MIME-Version: 1.0
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
To: Dave Taht <dave.taht@gmail.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>

On Mon, 19 Nov 2018, Dave Taht wrote:

>> I'm not sure if this was a fluke or not, but at Starbucks recently I sat outside,
>> right next to their window, and could not scan their AP at all.  Previously, I sat
>> inside, 3 feet away through the glass, and got great signal.  I wonder what that was
>> all about!  Maybe special tinting that blocks RF?  Or just dumb luck of some sort.
>
> Ya know, I could definitely see a market for a material like that! I'd
> like it for my car, so bluetooth wouldn't escape.

That would break your tire pressure sensors (each car is rolling around 
broadcasting 4 unique bluetooth IDs, not hard to track)

David Lang

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
