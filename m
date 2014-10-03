Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZvjQ-00075M-7p
 for ath10k@lists.infradead.org; Fri, 03 Oct 2014 05:48:45 +0000
Received: by mail-wi0-f180.google.com with SMTP id em10so1042516wid.1
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 22:48:21 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Fri, 3 Oct 2014 01:48:01 -0400
Message-ID: <CAHqTa-2yz13WAgvXxJVYMXQ7fVqRtuQ8ABAC6vKv07=fne_YGw@mail.gmail.com>
Subject: Probe Response packets sometimes delayed by 200ms
Content-Type: multipart/mixed; boundary=047d7bfcf914d72fc305047e4704
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

--047d7bfcf914d72fc305047e4704
Content-Type: text/plain; charset=UTF-8

Hi all,

We're chasing a problem where, with an ath10k device running as access
point and a Macbook Air as a client, responses to probe requests are
sometimes missed by the Macbook Air because they are delayed for a
long time, and the Macbook has changed channels by the time they come
through.

ath10k driver version: from backports as of kvalo/ath-next on
2014-03-08 (v3.15-rc1-237-gd9bc4b9)

Firmware version: 10.1.467.3

Steps:
- start capturing packets, either on the ath10k AP itself or a
secondary monitor system
- on the Macbook Air (which has joined your SSID at least once
before), open and close the wifi dropdown menu a few times.  (May also
happen with clients other than Macbook Air; not heavily tested.)

Expected:
- Probe requests are sent by the station and answered by the AP within
a millisecond or two.

Actual:
- Probe requests are often answered within a millisecond or two, but
very frequently they are delayed by 200ms.  They are therefore not
seen by the Macbook, and thus not acknowledged, so you can see them
retransmitted several times by the AP.

I suspect this has something to do with the AP thinking the Macbook is
in power saving mode.  In the attached capture, the last packet (a
wifi ack) received from the Macbook before the probe request does
indeed say it's going to sleep.  But then it sends a new probe request
a few ms later.  The AP doesn't respond until its original wakeup
time.  I think it should consider the station to have woken up
immediately, since it just sent a packet.  This is especially true
since the powersaving flag in the Probe Request packet is set to zero
(station will stay up).

See attached pcap.  I trimmed out some beacons for APs that are not
related to the test, but otherwise it's intact.

$ zcat /tmp/reduced-delayed-proberesp.pcap.gz | tcpdump -r -
...
00:42:12.670744 1947809503us tsft 6.0 Mb/s 5745 MHz 11a -38dB signal
antenna 1 Probe Request (AVERY_Bu1_TestWifi) [6.0 9.0 12.0 18.0 24.0
36.0 48.0 54.0 Mbit]
00:42:12.672960 1947812849us tsft 6.0 Mb/s 5745 MHz 11a -37dB signal
antenna 1 Probe Request () [6.0 9.0 12.0 18.0 24.0 36.0 48.0 54.0
Mbit]
...
00:42:12.712490 1947853161us tsft 6.0 Mb/s 5745 MHz 11a -39dB signal
antenna 1 Beacon (AVERY_Bu1_TestWifi) [6.0* 9.0 12.0* 18.0 24.0* 36.0
48.0 54.0 Mbit] ESS CH: 149, PRIVACY
...
00:42:12.814832 1947955593us tsft 6.0 Mb/s 5745 MHz 11a -40dB signal
antenna 1 Beacon (AVERY_Bu1_TestWifi) [6.0* 9.0 12.0* 18.0 24.0* 36.0
48.0 54.0 Mbit] ESS CH: 149, PRIVACY
...
00:42:12.878434 1948017652us tsft 6.0 Mb/s 5745 MHz 11a -40dB signal
antenna 1 Probe Response (AVERY_Bu1_TestWifi) [6.0* 9.0 12.0* 18.0
24.0* 36.0 48.0 54.0 Mbit] CH: 149, PRIVACY
00:42:12.878450 1948017995us tsft 6.0 Mb/s 5745 MHz 11a -39dB signal
antenna 1 Probe Response (AVERY_Bu1_TestWifi) [6.0* 9.0 12.0* 18.0
24.0* 36.0 48.0 54.0 Mbit] CH: 149, PRIVACY
00:42:12.878455 1948018367us tsft 6.0 Mb/s 5745 MHz 11a -39dB signal
antenna 1 Probe Response (AVERY_Bu1_TestWifi) [6.0* 9.0 12.0* 18.0
24.0* 36.0 48.0 54.0 Mbit] CH: 149, PRIVACY
00:42:12.878463 1948018730us tsft 6.0 Mb/s 5745 MHz 11a -39dB signal
antenna 1 Probe Response (AVERY_Bu1_TestWifi) [6.0* 9.0 12.0* 18.0
24.0* 36.0 48.0 54.0 Mbit] CH: 149, PRIVACY

Any suggestions?  I looked at ath10k driver patches since the date we
last grabbed a copy, and I don't see anything relevant.

--047d7bfcf914d72fc305047e4704
Content-Type: application/x-gzip; name="reduced-delayed-proberesp.pcap.gz"
Content-Disposition: attachment; 
	filename="reduced-delayed-proberesp.pcap.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i0t3vuvd0

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
Mw1aaCUAAA==
--047d7bfcf914d72fc305047e4704
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--047d7bfcf914d72fc305047e4704--
