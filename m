Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMduC-0004aU-3i
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 15:45:44 +0000
Received: by mail-yk0-x232.google.com with SMTP id k129so91107774yke.0
 for <ath10k@lists.infradead.org>; Fri, 22 Jan 2016 07:45:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160122125155.GI14453@localhost>
References: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
 <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
 <CANCHnQryCaT9-qVfVrGO8Y8=cK_4pxbBArtfRQewp_gYA7hMHQ@mail.gmail.com>
 <20160122125155.GI14453@localhost>
Date: Fri, 22 Jan 2016 16:45:22 +0100
Message-ID: <CANCHnQqTXtjbuGtZHFLCEn4K+u+bqyKzEOL5DvSPSSZiPT04Xg@mail.gmail.com>
Subject: Re: Mesh on ath10k drops all packets
From: Jeroen Roovers <jeroen.roovers@airfi.aero>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: ath10k@lists.infradead.org

On 22 January 2016 at 13:51, Bob Copeland <me@bobcopeland.com> wrote:
> On Fri, Jan 22, 2016 at 12:01:36PM +0100, Jeroen Roovers wrote:
>> Maybe related?
>
> Could be.

[..]

> What happens with non-secure mesh, i.e.:
>
> user_mpm=1
> network={
>     mode=5
>     ssid="_"
>     frequency=2412
>     key_mgmt=NONE
> }

That works fine!

> You don't really need to specify proto, pairwise, and group, by the way.

I seem to recall having to do this for an older version of wpa_supplicant.

>> > On 22 January 2016 at 11:38, Jeroen Roovers <jeroen.roovers@airfi.aero> wrote:
>> >> Jan 22 11:34:21 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> >> Jan 22 11:34:22 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
>> >> invalid, t_offset=1712128384
>> >> Jan 22 11:34:22 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> >> Jan 22 11:34:23 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
>> >> Jan 22 11:34:23 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
>> >> Jan 22 11:34:24 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
>> >> invalid, t_offset=1714176384
>
> All of this is just mesh sync debugging, you actually don't really need
> mesh sync unless you are doing power save, collision avoidance, or
> controlled channel access, none of which are fully implemented in the
> kernel.

Yes, that seems to be because I turned on lots of debug output in the
ath10 driver.

Regards,
     jer

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
