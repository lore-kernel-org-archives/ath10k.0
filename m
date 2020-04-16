Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3jS-0003fl-Vf
 for ath10k@lists.infradead.org; Thu, 16 Apr 2020 12:35:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Killer WiFi card keeps disconnecting due to latest firmware
References: <b07a7ea1-7ab2-8ce3-95d7-6726e7708749.ref@aol.com>
 <b07a7ea1-7ab2-8ce3-95d7-6726e7708749@aol.com>
Date: Thu, 16 Apr 2020 15:34:54 +0300
In-Reply-To: <b07a7ea1-7ab2-8ce3-95d7-6726e7708749@aol.com> (Nicola Mori's
 message of "Tue, 14 Apr 2020 09:26:16 +0200")
Message-ID: <87ftd3r4lt.fsf@kamboji.qca.qualcomm.com>
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
To: Nicola Mori <nicolamori@aol.com>
Cc: ath10k@lists.infradead.org, Wen Gong <wgong@codeaurora.org>

Nicola Mori <nicolamori@aol.com> writes:

> Hi, I have an issue with the WiFi card in my laptop, that keeps
> disconnecting from the network in a strange way: randomly every 1-2 
> hours I can't access web pages or even ping the gateway, but existing
> connections (like existing ssh sessions or Zoom videoconferences)
> continue to work. The only solution is to restart the network
> connection.
>
> The fix for me has been to downgrade the firmware by removing
> /usr/lib/firmware/ath10k/QCA6174/hw3.0/firmware-6.bin so that
> /usr/lib/firmware/ath10k/QCA6174/hw3.0/firmware-4.bin is used; with
> this, I have no issues.

These firmware filenames tell nothing to me (-6 and -4 are just
interface version numbers), I need the exact firmware versions of which
works and which doesn't. 'dmesg | grep ath10k' is the best way to get
them.

Also adding Wen to the loop.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
