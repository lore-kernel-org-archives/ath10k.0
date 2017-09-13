Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from kirsty.vergenet.net ([202.4.237.240])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1drvLc-0005cw-Ig
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 00:16:10 +0000
Date: Wed, 13 Sep 2017 09:15:36 +0900
From: Carsten Haitzler <raster@rasterman.com>
Subject: Re: failed to fetch board data QCA6174
Message-Id: <20170913091536.aefe1f16e91dcec2c69ee7b5@rasterman.com>
In-Reply-To: <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
Mime-Version: 1.0
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: Luka Karinja <luka.karinja@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, 12 Sep 2017 23:14:33 +0000 Ryan Hsu <ryanhsu@qti.qualcomm.com> said:

> On 09/12/2017 12:24 AM, Luka Karinja wrote:
> 
> > [    3.662941] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x05030000
> > chip_id 0x00340aff sub 0000:0000 
> 
> Hmm, where did you get this module? it seems like this module is not
> calibrated or assigned a sub IDs information, that why it cause the failure,
> since incorrect board file will lead to the firmware crash.
> 
> You might want to contact your module provider to give you the correct board
> file (board.bin) and replace it under the same firmware folder for
> testing/developing.

I see similar/same issues on an actual product (not some module or dev board).
a new-ish laptop/tablet that runs windows out of the box. I sent mails to to
here and linux-wireless too with zero responses on information on what the
board bin file is and the firmware bin files and how they are created etc. as I
suspected the key to the issue is somewhere there.

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
Carsten Haitzler - raster@rasterman.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
