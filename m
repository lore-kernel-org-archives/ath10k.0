Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5S6K-0000b9-JI
 for ath10k@lists.infradead.org; Wed, 04 Sep 2019 10:01:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id w6so10013704lfl.2
 for <ath10k@lists.infradead.org>; Wed, 04 Sep 2019 03:01:15 -0700 (PDT)
Message-ID: <c74b5248ab0d5d5fa73226494c2179eeb767d725.camel@gmail.com>
Subject: QCA6174 ath10k firmware crash on kernel 5.x
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Date: Wed, 04 Sep 2019 13:01:10 +0300
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
To: ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Hi,

I've got a QCA6174 wireless device in my Dell XPS 13 9370. There is a
problematic AP, and every time I connect to this AP, the connection
only works for a couple of hours and then it stops working until I
disable and re-enable the wireless adapter.

Here is the dmesg log:
https://pastebin.com/CnbBSNg3

There is a firmware crash. Then the driver fails to read the firmware
dump.

Note that I've only seen the problem with this specific AP and not
others. Is there any way I can figure out what exactly is it with this
AP that triggers the problem?

Thanks & best regards,
Tim

ps. I'm not on the mailing list, please CC me on your replies.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
