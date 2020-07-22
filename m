Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp3-1.goneo.de ([85.220.129.38])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyFZe-0003IT-OK
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 14:18:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by smtp3.goneo.de (Postfix) with ESMTP id 5466A23F3BE
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2020 16:18:15 +0200 (CEST)
Received: from smtp3.goneo.de ([127.0.0.1])
 by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5Wez5nItYGF for <ath10k@lists.infradead.org>;
 Wed, 22 Jul 2020 16:18:13 +0200 (CEST)
Received: from brot (ip-84-118-3-241.unity-media.net [84.118.3.241])
 by smtp3.goneo.de (Postfix) with ESMTPSA id C5EFF23F9A8
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2020 16:18:13 +0200 (CEST)
Date: Wed, 22 Jul 2020 16:18:12 +0200
From: "Leon M. George" <leon@georgemail.eu>
Subject: Re: duplicate authentications / excessive missing ACKs / deauth due
 to inactivity timer
Message-ID: <20200722161812.329d7a10@brot>
MIME-Version: 1.0
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

Hi :-)

I've encountered connection issues that appear to be strongly related to the
problem in this thread [1] (found via the arch linux bug tracker [2]).

Symptoms:
ap: "disconnected due to excessive missing ACKs"
station: "No beacon heard and the time event is over already..."

Using a monitoring interface on the AP i was able to confirm that the beacon is
indeed not being sent at any time.

I've found a configuration that reliably produces this state
("error state" from here on):
If any number of mesh (or adhoc with ct) points are configured alongside any
number of ordinary APs, this issue starts appearing.
The mesh connections appear to be working correctly in the error state.

I tested various combinations of openwrt-19.xx and openwrt-trunk
with ath10k/ath10k-ct - all were affected.
Aligning with my vague memory, a user on the openwrt forum reports the issue isn't
present in openwrt-18.xx [3].

About the ruling out client issues:
My employer is operating installations with multiple hundreds of ath10k access
points.
We couldn't identify the source of the issue at first when we encountered it in
our live setup and received unsolicited reports from basically every
installation.
As far as we can tell, no client is able to connect in the error state.
We've had our users confirm the bug for
  - Apple phones/tablets/macbooks
  - Samsung phones, laptops
  - computers with Intel/Realtek/AzureWave-hardware.

I hope this info is helpful.

kind regards,
Leon George

[1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg11599.html
[2] https://bugs.archlinux.org/task/58457
[3] https://forum.openwrt.org/t/wifi-connectivity-issues-with-ath10k/67779

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
