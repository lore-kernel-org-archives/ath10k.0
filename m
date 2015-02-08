Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKRk6-0002Zc-RN
 for ath10k@lists.infradead.org; Sun, 08 Feb 2015 13:17:43 +0000
Message-ID: <54D761DC.9010001@dd-wrt.com>
Date: Sun, 08 Feb 2015 14:17:16 +0100
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
MIME-Version: 1.0
References: <54D760AF.4090805@aol.com>
In-Reply-To: <54D760AF.4090805@aol.com>
Subject: Re: First QCA6174 firmware release
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

Am 08.02.2015 um 14:12 schrieb Austin Hendrix:
> I have the same issue as Joris; my QCA6174 appears to be a hw2.1 
> version. lspci -vvv returns similar results.
>
> The wireless card is a " Killer N1525 Combo (2x2 ac)", in an MSI GS60 
> Ghost Pro 4K laptop; purchased in January of 2015.
>
> Similar to Joris, I've also found what appears to be firmware as part 
> of the existing Windows installation, but it looks like it's missing 
> the header information and magic bits that will allow it to load.
>
> Does anyone have any pointers on how I might go about confirming that 
> this is the correct firmware; preparing it for the ath10k driver with 
> the appropriate header, and preparing the matching board.bin file?
>
the format is very simple. you can write such a tool in about 30 minutes 
if you are a skilled programmer. i already did it. just need to find it 
on my hdd
> Thanks,
> -Austin
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
