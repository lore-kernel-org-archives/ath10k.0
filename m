Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkkXI-0004yK-Ol
 for ath10k@lists.infradead.org; Fri, 16 Sep 2016 04:14:02 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA6174 Performance
Date: Fri, 16 Sep 2016 04:13:12 +0000
Message-ID: <87mvj8a3e0.fsf@kamboji.qca.qualcomm.com>
References: <3683ea4d-10ce-80a1-2e11-4b873f4129b8@gmx.de>
In-Reply-To: <3683ea4d-10ce-80a1-2e11-4b873f4129b8@gmx.de> (Daniel Holz's
 message of "Thu, 15 Sep 2016 15:29:47 +0200")
Content-Language: en-US
Content-ID: <23599C4955FA2546AA915C2AA2962F84@qualcomm.com>
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
To: Daniel Holz <daniel.holz91@gmx.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Daniel Holz <daniel.holz91@gmx.de> writes:

> the network performance of the Qualcom QCA6174 in my Lenovo Yoga 3 11
> is only around 7-8 Mbyte/s in tests with iperf when using a wireless
> ac connection. Disabling power management resulted in 10 MByte/s.
> Under the same conditions my Android phone achieved 384 MByte/s.
>
> Currently I'm using Ubuntu 16.04 on my Yoga 3 11 with the most recent
> hw2.1 firmware and kernel 4.4. I already tried kernel 4.8 which
> boosted the speed to 15 MByte/s, but this is still way too slow for
> such a connection.

Might be a problem with the board file, are you using the latest one?
dmesg and 'lspci -vnn' outputs help to analyse the issue more.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
