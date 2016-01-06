Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGtzb-0006p8-0w
 for ath10k@lists.infradead.org; Wed, 06 Jan 2016 19:43:35 +0000
Received: by mail-wm0-x22f.google.com with SMTP id f206so72119114wmf.0
 for <ath10k@lists.infradead.org>; Wed, 06 Jan 2016 11:43:14 -0800 (PST)
Received: from [10.0.0.30] ([185.120.126.128])
 by smtp.gmail.com with ESMTPSA id bh6sm97655870wjb.0.2016.01.06.11.43.12
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Wed, 06 Jan 2016 11:43:13 -0800 (PST)
From: vagner <vagnerrener@gmail.com>
Subject: Qualcomm Atheros Device 0042 (rev 30)
Message-ID: <568D6E4A.8050407@gmail.com>
Date: Wed, 6 Jan 2016 21:43:06 +0200
MIME-Version: 1.0
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

I Have a new laptop:

Lenovo ideapad 300-15
Intel i5 6th generation

Running Debian Stretch/Testing. And my wireless card does not work. I 
have tried all sort of solutions. Including compiling with backports. 
But, my kernel is new, using the same backports new version.
How can I make this nightmare card work in my machine? Please, help.

uname -a

  4.3.0-1-amd64 #1 SMP Debian 4.3.3-2 (2015-12-17) x86_64 GNU/Linux

lspci
> 02:00.0 Network controller: Qualcomm Atheros Device 0042 (rev 30)

lshw -C network

>  *-network UNCLAIMED
>        description: Network controller
>        product: Qualcomm Atheros
>        vendor: Qualcomm Atheros
>        physical id: 0
>        bus info: pci@0000:02:00.0
>        version: 30
>        width: 64 bits
>        clock: 33MHz
>        capabilities: pm msi pciexpress bus_master cap_list
>        configuration: latency=0
>        resources: memory:a1000000-a11fffff

Thx


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
