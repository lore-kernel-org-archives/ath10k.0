Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq0pF-0002GK-Vt
 for ath10k@lists.infradead.org; Wed, 06 May 2015 15:01:30 +0000
Received: by lbbqq2 with SMTP id qq2so9662591lbb.3
 for <ath10k@lists.infradead.org>; Wed, 06 May 2015 08:01:06 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 May 2015 17:01:06 +0200
Message-ID: <CAMCCUbgZRhNCWTQkspCuRdCTQy6SpmihEKFHfY8ija4+zYTLiw@mail.gmail.com>
Subject: Cannot achieve throughput higher than 460Mbps using CT firmware and
 3x3 ath10k
From: richard mayers <richard.mayers92@gmail.com>
Content-Type: multipart/mixed; boundary=089e0160b7be878ff805156b10cc
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
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>

--089e0160b7be878ff805156b10cc
Content-Type: text/plain; charset=UTF-8

Hi all,

The maximum throughput I get with the following set up is around
460-470Mbits/s when using MCS 6, 80MHz channel and 3 spatial streams.
However, when I try MCS 7, the throughput drops to 200Mbits/s, and
when I use 8 or 9 it goes to 0. The signal level is -11dBm which I
guess is quite good.

Do you have any indications of what I do wrong and cannot get 600Mbps
throughput, as mention in previous messages in this list? Any help is
highly appreciated.

My set up is as follows:

- STA: compex wle900vx (QCA988x), ubuntu 14.04 LTS, dell dual core
1.66ghz, kernel version 3.16, driver backport 4.0.1 and as a firmware
the commercial firmware from Candela Tech (
10.4.467-ct-com-full-013-b5b14a).

- AP: Has the same set up, but is running hostapd with the
configuration file that you can find attached.

- I tried with many distances, but to make it easier now I have them
placed 50cm from each other (with no obstacles in between), with
3-antenna array and each antenna separated 12 cm from each other.

- For the throughput tests I use iperf (UDP). I run the server in the
AP, and the client in the station (upload). Command used in the client
: "iperf -c <IP> -i 1 -b 600m -S 0x08".

I also tried different drivers, kernels, firmware, distances between
STA and AP, kernel sockets buffers, etc.. But I can not get better
results.

--089e0160b7be878ff805156b10cc
Content-Type: application/octet-stream; name="hostapd80.conf"
Content-Disposition: attachment; filename="hostapd80.conf"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i9cu4yfq0

ZHJpdmVyPW5sODAyMTEKbG9nZ2VyX3N5c2xvZz0xMjcKbG9nZ2VyX3N5c2xvZ19sZXZlbD0yCmxv
Z2dlcl9zdGRvdXQ9MTI3CmxvZ2dlcl9zdGRvdXRfbGV2ZWw9Mgpod19tb2RlPWEKY2hhbm5lbD0x
NDkKCmllZWU4MDIxMW49MQpodF9jYXBhYj1bSFQ0MCtdW0xEUENdW1NIT1JULUdJLTIwXVtTSE9S
VC1HSS00MF1bVFgtU1RCQ11bUlgtU1RCQzFdW01BWC1BTVNEVS03OTM1XVtEU1NTX0NDSy00MF0K
dmh0X29wZXJfY2h3aWR0aD0xCnZodF9vcGVyX2NlbnRyX2ZyZXFfc2VnMF9pZHg9MTU1CmllZWU4
MDIxMWFjPTEKdmh0X2NhcGFiPVtSWExEUENdW1NIT1JULUdJLTgwXVtUWC1TVEJDLTJCWTFdW1JY
LUFOVEVOTkEtUEFUVEVSTl1bVFgtQU5URU5OQS1QQVRURVJOXVtSWC1TVEJDMV1bTUFYLU1QRFUt
MTE0NTRdW01BWC1BLU1QRFUtTEVOLUVYUDddCgppbnRlcmZhY2U9d2xhbjQKY3RybF9pbnRlcmZh
Y2U9L3Zhci9ydW4vaG9zdGFwZApkaXNhc3NvY19sb3dfYWNrPTEKcHJlYW1ibGU9MQp3bW1fZW5h
YmxlZD0xCmlnbm9yZV9icm9hZGNhc3Rfc3NpZD0wCnVhcHNkX2FkdmVydGlzZW1lbnRfZW5hYmxl
ZD0xCmF1dGhfYWxncz0xCndwYT0wCnNzaWQ9d2lyZWxlc3NBQwpic3NpZD0wNDpmMDoyMToxMTpl
Njo3NgoK
--089e0160b7be878ff805156b10cc
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--089e0160b7be878ff805156b10cc--
