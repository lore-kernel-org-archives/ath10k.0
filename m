Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLmqc-0007MF-OA
 for ath10k@lists.infradead.org; Thu, 12 Feb 2015 06:01:59 +0000
Received: by pdev10 with SMTP id v10so9660477pde.7
 for <ath10k@lists.infradead.org>; Wed, 11 Feb 2015 22:01:37 -0800 (PST)
Received: from [192.168.1.177] (c-76-126-185-64.hsd1.ca.comcast.net.
 [76.126.185.64])
 by mx.google.com with ESMTPSA id qy3sm2598858pbc.4.2015.02.11.22.01.35
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Feb 2015 22:01:36 -0800 (PST)
Message-ID: <54DC4284.6020009@gmail.com>
Date: Wed, 11 Feb 2015 22:04:52 -0800
From: Austin Hendrix <namniart@gmail.com>
MIME-Version: 1.0
Subject: Re: First QCA6174 firmware release
References: <54D761DC.9010001@dd-wrt.com>
In-Reply-To: <54D761DC.9010001@dd-wrt.com>
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

I consider myself a fairly skilled programmer; if the format is 
documented somewhere, I have no doubt that I can write a tool to put the 
firmware into the proper format. Does anyone know where the firmware 
format is documented, or do I have to go read the source for the driver 
to figure out the firmware format?

The bigger question is, how can I confirm that I'm wrapping the correct 
firmware?

I found a qca61x420.bin file (probably firmware; definitely compiled 
code) in /Windows/System32/drivers/qca61x420.bin , but the ath10k driver 
doesn't recognize it as firmware.

Thanks,
-Austin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
