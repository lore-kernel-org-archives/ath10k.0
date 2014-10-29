Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjcBA-0007J3-T1
 for ath10k@lists.infradead.org; Wed, 29 Oct 2014 22:57:25 +0000
Received: by mail-qa0-f51.google.com with SMTP id f12so2861953qad.38
 for <ath10k@lists.infradead.org>; Wed, 29 Oct 2014 15:57:03 -0700 (PDT)
MIME-Version: 1.0
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Wed, 29 Oct 2014 15:56:32 -0700
Message-ID: <CAD1M062Um6PY2fE4AiM6D3=_McdTMkixzYQ23kYwM7_xdZR=wA@mail.gmail.com>
Subject: TX Power Concerns between Firmware
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi all,

I haven't seen this brought up before, but has anyone done power meter
readings on ath10k with the various firmware? If anyone has, can you
verify my findings below? There seems to be an issue between the two
firmware. Please note that I've tested both the latest ath10k
git/master as well as a version a few months back.

I just compared 10.1.467.2-1 and 999.999.0.636 firmware versions on
several WLE900VX cards (to verify consistency). Reading the datasheet
(http://www.compex.com.sg:809/Datasheets/WLE900VX_Dsv1.0.3-271013-I.pdf)
shows that at the highest MCS rate it supports at the 5GHz range, the
max txpower per chain is 10dBm, and aggregate txpower is 15dBm (+/-
2dB).

My test setup was as follows (please excuse my ascii art):

----------
|dut(ap) |
|           |
|C C C   |
|H H H   |
|0 1 2    |
----------
 | | |_______[power-meter]
 | |
----------
|0 1 2    |
|H H H   |
|C C C   |
|            |
|dut(sta) |
----------


If the above art is unreadable, that's two WLE900VX radios, one
configured as an AP, the other as a STA. CH0 and CH1 were connected
via 30dBm attenuators and the third chain of the radio configured as
an AP was connected to the power meter via a 10dB attenuator. With
cabling etc, there was probably about a 15dB attenuation between the
power meter and radio.

I used software (iw) to configure the txpower of the ap radio and
performed an iperf test to generate traffic (if anyone knows how to
get a single radio into continuous transmit mode, please let me know,
it will help this test immensely).

The follow are my results:
| Firmware     | txpower (software) | reading | +15dBm offset |
| 10.1.467.2-1 | 15                       | -6         | 9                     |
| ''                  | 10                       | -10.6     | 4.4
             |

Then same radio(s), different firmware:
| Firmware        | txpower (software) | reading | +15dBm offset |
| 999.999.0.636 | 15                        | 10.3     | 25.3                |
| ''                    | 10                        | 7.5       | 22.5
               |


As you can see, the results are wildly different. Is this something
that the driver can fix? Or is this a firmware problem? It goes
without saying that this is a big danger for devices etc connected to
the radio.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
