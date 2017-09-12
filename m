Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1druON-0002Du-Ty
 for ath10k@lists.infradead.org; Tue, 12 Sep 2017 23:15:00 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: failed to fetch board data QCA6174
Date: Tue, 12 Sep 2017 23:14:33 +0000
Message-ID: <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
In-Reply-To: <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
Content-Language: en-US
Content-ID: <DE7D050E2120504C9AAB936184AE1EDD@qualcomm.com>
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
To: Luka Karinja <luka.karinja@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/12/2017 12:24 AM, Luka Karinja wrote:

> [    3.662941] ath10k_pci 0000:05:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 0000:0000 

Hmm, where did you get this module? it seems like this module is not calibrated or assigned a sub IDs information, that why it cause the failure, since incorrect board file will lead to the firmware crash.

You might want to contact your module provider to give you the correct board file (board.bin) and replace it under the same firmware folder for testing/developing.

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
