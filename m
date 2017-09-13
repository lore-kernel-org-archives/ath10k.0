Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsFwJ-0006Ed-NE
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 22:15:25 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: failed to fetch board data QCA6174
Date: Wed, 13 Sep 2017 22:14:55 +0000
Message-ID: <ef5a7431-deea-05fa-131c-87352201642d@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
 <8b76e913-1205-db34-915b-658fdc017afe@gmail.com>
 <54ec1899-7db8-088f-e2a9-dc5e532d0cea@qti.qualcomm.com>
 <bb17d89c-3757-1f57-801e-eee70380ad09@gmail.com>
In-Reply-To: <bb17d89c-3757-1f57-801e-eee70380ad09@gmail.com>
Content-Language: en-US
Content-ID: <3133E4C6F431914AB4E2E9D7C5709709@qualcomm.com>
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

On 09/13/2017 12:24 PM, Luka Karinja wrote:

> On 09/13/2017 09:00 AM, Ryan Hsu wrote:
> i did try:
> eeprom_ar6320_3p0_NFA344a.bin
> eeprom_ar6320_3p0_NFA344a_BLP.bin
> eeprom_ar6320_3p0_NFA344A_power1213.bin
> with the same calibration not found errors
>

Thanks for testing them out, glad it works.

> so if i understand correctly, the only way to get it working is with manufacturers board.bin?

Well, yes, so every boards have different characteristics, usually the manufacturer will know them and compile a board file that match to the module.
From this case, it is likely they're building the board, but didn't do the calibration, so that it failed to find the right board (either in board-2.bin or board.bin) file to load.

One note, even it is working to your board, but it might not the optimal case, as these are the general board file (e.g for NFA344A).
So if you need to run peak throughput testing it'll really need help from the manufacturer to provide or guide you to the right file for your module.

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
