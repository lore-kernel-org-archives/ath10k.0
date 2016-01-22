Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMZNL-0005q2-W3
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 10:55:32 +0000
Received: by mail-yk0-x232.google.com with SMTP id a85so81821142ykb.1
 for <ath10k@lists.infradead.org>; Fri, 22 Jan 2016 02:55:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
References: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
Date: Fri, 22 Jan 2016 11:55:10 +0100
Message-ID: <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
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
To: ath10k@lists.infradead.org

wpa_supplicant config looks like this:

user_mpm=1
update_config=1

network={
        mode=5
        ssid="_"
        frequency=2412
        proto=RSN
        key_mgmt=SAE
        pairwise=CCMP
        group=CCMP
        psk="..."
}

On 22 January 2016 at 11:38, Jeroen Roovers <jeroen.roovers@airfi.aero> wrote:
> Jan 22 11:34:21 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:22 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
> invalid, t_offset=1712128384
> Jan 22 11:34:22 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:23 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
> Jan 22 11:34:23 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:24 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
> invalid, t_offset=1714176384
> Jan 22 11:34:24 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:25 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
> t_offset=1715200384, t_offset_setpoint=1714176364,
> t_clockdrift=-1024020
> Jan 22 11:34:25 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
> t_clockdrift=-1024020 too large, setpoint reset
> Jan 22 11:34:25 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:26 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
> Jan 22 11:34:26 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:27 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
> invalid, t_offset=1717248384
> Jan 22 11:34:27 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:28 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
> t_offset=1718272384, t_offset_setpoint=1717248364,
> t_clockdrift=-1024020
> Jan 22 11:34:28 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
> t_clockdrift=-1024020 too large, setpoint reset
> Jan 22 11:34:28 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
> Jan 22 11:34:29 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
> invalid, t_offset=1719296384
>
> I seem to be able to get an RSN mesh going using wpa_supplicant, but
> the ath10k sees only its own packets in tcpdump while the ath9k on the
> other side sees everything.
>
> Kernel is 4.4.0. Firmware is 10.2.4.70.17-2.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
