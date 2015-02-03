Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIguQ-0000Gx-J9
 for ath10k@lists.infradead.org; Tue, 03 Feb 2015 17:05:07 +0000
Received: by mail-wi0-f172.google.com with SMTP id h11so25921318wiw.5
 for <ath10k@lists.infradead.org>; Tue, 03 Feb 2015 09:04:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87fvawcp7d.fsf@kamboji.qca.qualcomm.com>
References: <87fvawcp7d.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 3 Feb 2015 18:04:42 +0100
Message-ID: <CAAmLN2an0K7vtzgkVDSJ2MJ-2bsWnpOtGmQRM_P2UkGT5zGNAw@mail.gmail.com>
Subject: Re: First QCA6174 firmware release
From: Joris Guisson <joris.guisson@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

Where is the QCA6174 v2.1 firmware ?

I'm getting these errors from the latest ath kernel:

[ 1660.748740] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/cal-pci-0000:04:00.0.bin failed with error -2
[ 1660.748767] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/firmware-4.bin failed with error -2
[ 1660.748770] ath10k_pci 0000:04:00.0: could not fetch firmware file
'ath10k/QCA6174/hw2.1/firmware-4.bin': -2
[ 1660.748777] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/firmware-3.bin failed with error -2
[ 1660.748779] ath10k_pci 0000:04:00.0: could not fetch firmware file
'ath10k/QCA6174/hw2.1/firmware-3.bin': -2
[ 1660.748785] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/firmware-2.bin failed with error -2
[ 1660.748787] ath10k_pci 0000:04:00.0: could not fetch firmware file
'ath10k/QCA6174/hw2.1/firmware-2.bin': -2
[ 1660.748793] ath10k_pci 0000:04:00.0: Direct firmware load for
ath10k/QCA6174/hw2.1/board.bin failed with error -2
[ 1660.748795] ath10k_pci 0000:04:00.0: could not fetch board data (-2)
[ 1660.748797] ath10k_pci 0000:04:00.0: could not fetch firmware files (-2)
[ 1660.748799] ath10k_pci 0000:04:00.0: could not probe fw (-2)

Seeing, that I don't have these firmware files, this is logical. So
where can I find them ?

Joris,

On Tue, Jan 27, 2015 at 2:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Hi,
>
> I pushed the first QCA6174 firmware release to ath10k-firmware.git:
>
> https://github.com/kvalo/ath10k-firmware/tree/master/ath10k/QCA6174/hw3.0
>
> --
> Kalle Valo
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
