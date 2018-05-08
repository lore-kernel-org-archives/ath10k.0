Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG6Wt-0001rZ-By
 for ath10k@lists.infradead.org; Tue, 08 May 2018 17:36:14 +0000
Received: by mail-pg0-x243.google.com with SMTP id l2-v6so21464213pgc.7
 for <ath10k@lists.infradead.org>; Tue, 08 May 2018 10:35:48 -0700 (PDT)
Date: Tue, 8 May 2018 10:37:10 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 00/12] *** Add support for wifi QMI client driver ***
Message-ID: <20180508173710.GL2259@tuxbook-pro>
References: <1522042636-25516-1-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1522042636-25516-1-git-send-email-govinds@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sun 25 Mar 22:37 PDT 2018, Govind Singh wrote:

> Add QMI client driver for Q6 integrated WLAN connectivity subsystem.
> This module is responsible for communicating WLAN control messages to FW
> over QMI interface.
> =

> =93QUALCOMM Messaging Interface=94(QMI) provides the control interface be=
tween
> components running b/w remote processors with underlying transport layer
> based on integrated chipset(shared memory) or discrete chipset(PCI/USB/SD=
IO/UART).
> =

> QMI client driver implementation is based on qmi frmework https://lwn.net=
/Articles/729924/.
> =

> Below is the sequence of qmi handshake.
> =

>        QMI CLIENT(APPS)                                         QMI SERVE=
R(FW in Q6)
> =

>                          <------wlan service discoverd----
> =

>                        -----connect to wlam qmi service----->
> =

>                        ------------wlan info request----->
> =

>                        <------------wlan info resp------------
> =

>                        ------------msa info req-------->
> =

>                      <------------msa info resp------------
> =

>                      ------------msa ready req-------->
> =

>                      <------------msa ready resp------------
> =

>                      <------------msa ready indication-------
> =

>                      ------------capability req------->
> =

>                     <------------capability resp------------
> =

>                     ------------qmi bdf req--------->
> =

>                      <------------qmi bdf resp------------
> =

>                       ------------qmi cal trigger------->
> =

>                   <------------ QMI FW ready indication-------

Does the responsibility of the driver ends here? I mean is this a driver
for setting up the firmware and then there's something else doing the
actual wifi operation, or does it simply hand over execution to the
common ath10k logic at this point?

> =

> Govind Singh (12):
>   ath10k: Add qmi service for wlan qmi client
>   dt: bindings: add bindings for ath10k qmi client
>   ath10k: Add WCN3990 QMI client driver
>   ath10k: add support to start and stop qmi service
>   ath10k: Add support of QMI indication message
>   firmware: qcom: scm: Add WLAN VMID for Qualcomm SCM interface
>   ath10k: Add MSA handshake QMI mgs support
>   ath10k: Add QMI CAP request support
>   ath10k: Add QMI HOST CAP request support
>   ath10k: add bdf/cal indication support
>   ath10k: Add wlan mode on/off qmi message
>   ath10k: Add qmi wlan enable/disable support for WCN3990

I'm missing this last patch in my mailbox, and it would be nice if all
the patches where in-reply-to the cover letter, to make them easier to
find.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
