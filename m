Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds0jc-0003yh-CI
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 06:01:18 +0000
Received: by mail-wr0-x22a.google.com with SMTP id a43so26455251wrc.0
 for <ath10k@lists.infradead.org>; Tue, 12 Sep 2017 23:00:54 -0700 (PDT)
Subject: Re: failed to fetch board data QCA6174
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
From: Luka Karinja <luka.karinja@gmail.com>
Message-ID: <323b1df8-741e-77cd-708b-bb306696f092@gmail.com>
Date: Wed, 13 Sep 2017 08:00:51 +0200
MIME-Version: 1.0
In-Reply-To: <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
Content-Language: en-US
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


On 09/13/2017 01:14 AM, Ryan Hsu wrote:
> On 09/12/2017 12:24 AM, Luka Karinja wrote:
>
>> [    3.662941] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 0000:0000
> Hmm, where did you get this module? it seems like this module is not calibrated or assigned a sub IDs information, that why it cause the failure, since incorrect board file will lead to the firmware crash.
>
> You might want to contact your module provider to give you the correct board file (board.bin) and replace it under the same firmware folder for testing/developing.
>

Hello. Its a module from ebay. So probably i can't do much with it 
without the right board.bin?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
