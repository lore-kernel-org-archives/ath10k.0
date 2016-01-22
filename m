Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x230.google.com ([2607:f8b0:4002:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMZ7K-0006hy-N7
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 10:38:59 +0000
Received: by mail-yk0-x230.google.com with SMTP id k129so81993563yke.0
 for <ath10k@lists.infradead.org>; Fri, 22 Jan 2016 02:38:36 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 22 Jan 2016 11:38:34 +0100
Message-ID: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
Subject: Mesh on ath10k drops all packets
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

Jan 22 11:34:21 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:22 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
invalid, t_offset=1712128384
Jan 22 11:34:22 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:23 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
Jan 22 11:34:23 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:24 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
invalid, t_offset=1714176384
Jan 22 11:34:24 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:25 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_offset=1715200384, t_offset_setpoint=1714176364,
t_clockdrift=-1024020
Jan 22 11:34:25 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_clockdrift=-1024020 too large, setpoint reset
Jan 22 11:34:25 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:26 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : is adjusting TBTT
Jan 22 11:34:26 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:27 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
invalid, t_offset=1717248384
Jan 22 11:34:27 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:28 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_offset=1718272384, t_offset_setpoint=1717248364,
t_clockdrift=-1024020
Jan 22 11:34:28 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 :
t_clockdrift=-1024020 too large, setpoint reset
Jan 22 11:34:28 wim kernel: wlan0: TBTT : max clockdrift=0; too small to adjust
Jan 22 11:34:29 wim kernel: wlan0: STA 40:e2:30:cb:9a:11 : offset was
invalid, t_offset=1719296384

I seem to be able to get an RSN mesh going using wpa_supplicant, but
the ath10k sees only its own packets in tcpdump while the ath9k on the
other side sees everything.

Kernel is 4.4.0. Firmware is 10.2.4.70.17-2.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
