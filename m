Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xf6b5-0007zX-B6
 for ath10k@lists.infradead.org; Fri, 17 Oct 2014 12:25:31 +0000
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: ath10k: calibration data through Device Tree?
From: Kumar Gala <galak@codeaurora.org>
In-Reply-To: <87vbnvhls4.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 17 Oct 2014 14:25:01 +0200
Message-Id: <F0D1326B-4716-4897-8259-1591B64EB55C@codeaurora.org>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <20141002132914.GN5788@leverpostej> <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net>
 <CAJ-VmomR+AzsUVqSik=ejntHHhQf_wj9kU==uCqWyk27M7Gp9w@mail.gmail.com>
 <CALCETrV_LoCJ_DHcyQ2ztyXfdH2vAF0r7OX29_nPj6gMcodBig@mail.gmail.com>
 <87vbnvhls4.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Andy Lutomirski <luto@amacapital.net>


On Oct 7, 2014, at 6:44 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:

> Andy Lutomirski <luto@amacapital.net> writes:
> =

>> Perhaps unsurprisingly, the OpenWRT patch that enables it to work for
>> real (by shoving a file into /lib/firmware that's contains a copy of
>> data read from flash) hasn't made it upstream.  I assume that the
>> purpose of this discussion is to settle on a real solution.
> =

> I'm hoping to have ath10k support three different methods to get
> calibration data:
> =

> 1) OTP (already supported)
> =

> 2) Device Tree (under discussion)
> =

> 3) from a file
> =

> I'm hoping to send patches for 2) and 3) soon.


As Arnd mentioned you would have something like:

pci {   =

        pcie@0 {
                reg =3D <0 0 0 0 0>; =

                #interrupt-cells =3D <1>;
                #size-cells =3D <2>;
                #address-cells =3D <3>;
                device_type =3D "pci";

                ath10k@0,0 {
                        reg =3D <0x0000 0x0 0x0 0x0 0x0>;
                        device_type =3D "pci";
                        qcom,ath10k-calibration-data =3D [ 01 03 04 05 06 =
=85 ];
                };      =

        };
};

On the driver side you can do something like:

	struct device_node *np;

	np =3D pci_device_to_OF_node(dev);

than you can do normal OF calls on =91np=92.

- k

-- =

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
