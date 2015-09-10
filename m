Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-rs1-vallila2.fe.helsinki.fi ([128.214.173.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZq2y-0008Tr-Bm
 for ath10k@lists.infradead.org; Thu, 10 Sep 2015 00:49:05 +0000
Received: from [192.168.1.91] (104-58-201-5.lightspeed.sntcca.sbcglobal.net
 [104.58.201.5]) (authenticated bits=0)
 by smtp-rs1.it.helsinki.fi (8.14.4/8.14.4) with ESMTP id t8A0mY73005075
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
 for <ath10k@lists.infradead.org>; Thu, 10 Sep 2015 03:48:38 +0300
Subject: Re: QCA6164 in Fedora
References: <55E8ED93.4040504@fedoraproject.org>
From: Susi Lehtola <jussilehtola@fedoraproject.org>
Message-ID: <55F0D35F.9040704@fedoraproject.org>
Date: Wed, 9 Sep 2015 17:48:31 -0700
MIME-Version: 1.0
In-Reply-To: <55E8ED93.4040504@fedoraproject.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

On 09/03/2015 06:02 PM, Susi Lehtola wrote:
> Hello people,
>
>
> I recently bought a Lenovo U31 laptop for work, and was surprised
> wireless didn't work out of the box.
>
> Fortunately thanks to you the card (supposedly) works in linux, but I
> have yet to get mine to work.
>
> I've patched the Fedora 4.1.6 kernel
>   https://bugzilla.redhat.com/attachment.cgi?id=1069561&action=diff
> to add support for the card, which I adapted from
>   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1436940
>
> However, I'm having trouble loading the firmware. I took the firmware
> files from
>
> https://github.com/atondwal/ath10k-firmware/commit/88fca85ef59d708b9874e5b7885416b58aef9ee7
>
> and installed them into /lib/firmware/ath10k/QCA6174/hw2.1/

I can confirm the card works with the linux-next tree, using a snapshot 
I took today.

However, it would be nice to get this working in the 4.1.6 kernel which 
supposedly supports the 6174 chip.

The problem in the Fedora kernel is that the direct firmware load fails, 
althoug the same firmware works with the linux-next tree.

What would need to be backported to the 4.1 tree in order to get the 
card working?
-- 
Susi Lehtola
Fedora Project Contributor
jussilehtola@fedoraproject.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
