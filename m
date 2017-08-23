Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkLH7-0006bk-Kk
 for ath10k@lists.infradead.org; Wed, 23 Aug 2017 02:20:11 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: ath10k frequently disconnects with firmware-6.bin
Date: Wed, 23 Aug 2017 02:19:38 +0000
Message-ID: <f5f1e657-7213-d3a3-7b80-db4060e38d4b@qti.qualcomm.com>
References: <32171fa5-5785-f844-ca76-e2536e66ce68@suse.cz>
In-Reply-To: <32171fa5-5785-f844-ca76-e2536e66ce68@suse.cz>
Content-Language: en-US
Content-ID: <822694401E2D0545B18E9EB681F9F165@qualcomm.com>
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
To: Jiri Slaby <jslaby@suse.cz>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 08/22/2017 02:11 AM, Jiri Slaby wrote:

> Hi,
>
> are you aware of this issue:
> https://bbs.archlinux.org/viewtopic.php?pid=1728715#p1728715
> ?
>
> If the guys use an older firmware, everything works.
>
> Is there any FW or code fix available somewhere?

Can you give it a try with Rm4.4.1 firmware?
https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/4.4.1

http://lists.infradead.org/pipermail/ath10k/2017-August/010055.html

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
