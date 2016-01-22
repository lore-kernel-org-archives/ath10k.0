Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22b.google.com ([2607:f8b0:400d:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMbEZ-00078O-OL
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 12:54:36 +0000
Received: by mail-qg0-x22b.google.com with SMTP id e32so56483486qgf.3
 for <ath10k@lists.infradead.org>; Fri, 22 Jan 2016 04:54:14 -0800 (PST)
Date: Fri, 22 Jan 2016 07:51:55 -0500
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: Mesh on ath10k drops all packets
Message-ID: <20160122125155.GI14453@localhost>
References: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
 <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
 <CANCHnQryCaT9-qVfVrGO8Y8=cK_4pxbBArtfRQewp_gYA7hMHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANCHnQryCaT9-qVfVrGO8Y8=cK_4pxbBArtfRQewp_gYA7hMHQ@mail.gmail.com>
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
To: Jeroen Roovers <jeroen.roovers@airfi.aero>
Cc: ath10k@lists.infradead.org

On Fri, Jan 22, 2016 at 12:01:36PM +0100, Jeroen Roovers wrote:
> Maybe related?

Could be.

> On 22 January 2016 at 11:55, Jeroen Roovers <jeroen.roovers@airfi.aero> wrote:
> > wpa_supplicant config looks like this:
> >
> > user_mpm=1
> > update_config=1
> >
> > network={
> >         mode=5
> >         ssid="_"
> >         frequency=2412
> >         proto=RSN
> >         key_mgmt=SAE
> >         pairwise=CCMP
> >         group=CCMP
> >         psk="..."
> > }

What happens with non-secure mesh, i.e.:

user_mpm=1
network={
    mode=5
    ssid="_"
    frequency=2412
    key_mgmt=NONE
}

You don't really need to specify proto, pairwise, and group, by the way.

> > On 22 January 2016 at 11:38, Jeroen Roovers <jeroen.roovers@airfi.aero> wrote:
> >> Jan 22 11:34:21 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> >> Jan 22 11:34:22 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
> >> invalid, t_offset=1712128384
> >> Jan 22 11:34:22 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> >> Jan 22 11:34:23 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
> >> Jan 22 11:34:23 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> >> Jan 22 11:34:24 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
> >> invalid, t_offset=1714176384

All of this is just mesh sync debugging, you actually don't really need
mesh sync unless you are doing power save, collision avoidance, or
controlled channel access, none of which are fully implemented in the
kernel.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
