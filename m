Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJeOy-0003A3-TO
 for ath10k@lists.infradead.org; Sat, 19 Sep 2020 15:03:49 +0000
Received: by mail-ej1-x635.google.com with SMTP id e23so11972072eja.3
 for <ath10k@lists.infradead.org>; Sat, 19 Sep 2020 08:03:48 -0700 (PDT)
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Linksys MR8300 specific BDFs
References: <1182738771.2553046.1600182130121.ref@mail.yahoo.com>
 <1182738771.2553046.1600182130121@mail.yahoo.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <349e8cab-263b-03c2-db06-0aa31d980eea@gmail.com>
Date: Sat, 19 Sep 2020 17:03:45 +0200
MIME-Version: 1.0
In-Reply-To: <1182738771.2553046.1600182130121@mail.yahoo.com>
Content-Language: de-DE
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
To: Hans Geiblinger <cybrnook2002@yahoo.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hello,

On 2020-09-15 17:02, Hans Geiblinger wrote:
> The support for this device is currently being added into OpenWrt. This AP requires
> two special BDFs to get the Wi-Fi PHYs working (correctly).
> 
> * description for what hardware this is:
> 
>    - it is a IPQ4019 based board
>    - one QCA40xx radio is used as 2.4GHz radio
>    - one QCA40xx radio is used as 5GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>    downloaded)
> 
>    - boarddata files were taken from OEM LinksysFW_MR8300_1.1.7.201281_prod.img
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>    - QCA4019 hw1.0
> 
>      +bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=linksys-mr8300-v0-fcc
>        SHA256: 0A8E9DBBD12A87AEDACA743B21756014F80C91FB4D1AB7FF7D1E7F059398522B
>      +bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=linksys-mr8300-v0-fcc
>        SHA256: A6DAF207C79BC6E0106ECD5231B5F127A36ED0A1AF5B324C5949CC07DA3CC925
Please use the md5sums: <https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles>
(Initially the checksums were sha256, but the tools already had the md5sum integrated.
 From what I know Kalle uses the checksum just to check that nothing got corrupted when
importing the mails)

> * attach the actual board file (board.bin)
> 
>    - All eight bin files have been included. For OpenWRT we will be using the "fcc" variant.

you might as well only post the fcc variants in that case.

>    - The name of the files are equal to the id string in the board-2.bin
>      (minus the ".bin")

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
