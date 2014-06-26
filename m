Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X09ER-0004tm-Fj
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 12:56:52 +0000
Message-ID: <53AC187C.2010309@candelatech.com>
Date: Thu, 26 Jun 2014 05:56:28 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: CT and AP firmware not allowed beaconing in adhoc mode
References: <CAEFj987hAnJV_0KOk4qfk3YbzPZNWqVY1Uq2sDe-+F0bw3hgbA@mail.gmail.com>	<CA+BoTQnnrjhUK_ZPwpG-L+wQ=suisNrkb1Tdhdww4ueMpAvDwQ@mail.gmail.com>	<53AAC317.4050403@candelatech.com>	<CAEFj9861McWmx4s81Y6bDirJX4s99_WG4W6Voi2fZRreoeB=4w@mail.gmail.com>
 <CAJ-VmonZUQzSLqGT=sU5OAxprYfv_cucho2rFMyP3gLap5--tg@mail.gmail.com>
In-Reply-To: <CAJ-VmonZUQzSLqGT=sU5OAxprYfv_cucho2rFMyP3gLap5--tg@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>, Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 06/26/2014 12:43 AM, Adrian Chadd wrote:
> On 26 June 2014 00:40, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> Not possible for all the modes to be supported in one single firmware?
>
> It (mostly) is; it's a question of time, effort and resources.
>
> There's a size limitation to how much code and data you can squeeze
> into the firmware. Is it possible to structure the firmware in a way
> that gives you one source tree for multiple firmware builds, with
> different features on and off? Quite so.
>
> That's just not how it happened inside of QCA. When I was working
> there on the ath10k chip bringup, there indeed was one branch to do
> station, adhoc and AP mode. That changed shortly after I left for
> reasons I don't quite know. I'm still trying to .. well, figure out
> how to try and repair that damage.

In my firmware, with 37 vdevs, I have maybe 2k of RAM left, but
55+k bytes of instruction ram (ie, where the program code can live left).

So, there is plenty of room for more code, and most people can get by with way
less than 37 vdevs, which saves both RAM and IRAM.

I am steadily improving RAM usage in CT firmware, mostly be naturally
packing structures, using bit shifting instead of uint32 for booleans, etc.

So, the code size is not the problem here....  Time and resources and the
fact we cannot share dev efforts with other developers due to NDA issues
is the main problem.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
