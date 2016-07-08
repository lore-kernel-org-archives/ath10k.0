Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLfQQ-0003WL-9w
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 23:43:15 +0000
Subject: Re: AR9882 IOMMU faults
References: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
 <1467983388208.13042@qti.qualcomm.com> <577FB15B.3050907@candelatech.com>
From: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <8e45724d-6edd-e366-5c53-8cbb9b0a09e2@redhat.com>
Date: Sat, 9 Jul 2016 09:45:29 +1000
MIME-Version: 1.0
In-Reply-To: <577FB15B.3050907@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7499904732280155248=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7499904732280155248==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iXMejWp1eev3N0gwN1TQa88FKITDeX242"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iXMejWp1eev3N0gwN1TQa88FKITDeX242
Content-Type: multipart/mixed; boundary="h1uCgCa9hurU6t7IskMcRX1IMVWhbVkeQ"
From: Ben Skeggs <bskeggs@redhat.com>
To: Ben Greear <greearb@candelatech.com>,
 "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Message-ID: <8e45724d-6edd-e366-5c53-8cbb9b0a09e2@redhat.com>
Subject: Re: AR9882 IOMMU faults
References: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
 <1467983388208.13042@qti.qualcomm.com> <577FB15B.3050907@candelatech.com>
In-Reply-To: <577FB15B.3050907@candelatech.com>

--h1uCgCa9hurU6t7IskMcRX1IMVWhbVkeQ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/08/2016 11:57 PM, Ben Greear wrote:
>=20
>=20
> On 07/08/2016 06:09 AM, Manoharan, Rajkumar wrote:
>> Logs are so limited. If possible, revert below commit and give a try
>>
>> "ath10k: do not use coherent memory for allocated device memory chunks=
"
>>
>> If revert is not so clean, try with this patch.
>>
>> https://patchwork.kernel.org/patch/9175029/
>=20
> I use this patch, I don't think it is upstream, and per comment, I have=
 not
> tested this on other than x86 platform:
Both the revert, and the change too DMA_BIDIRECTIONAL seem to resolve
the issue here (also on x86).

Thank you!
Ben.

>=20
> [greearb@ben-dt ath10k]$ git show 0e6e6f6b2
> commit 0e6e6f6b2fac0ade990de56eef3841dbe7128f35
> Author: Ben Greear <greearb@candelatech.com>
> Date:   Thu Jan 21 18:57:11 2016 -0800
>=20
>     ath10k:  wmi-alloc-chunk should use DMA_BIDIRECTIONAL.
>=20
>     These memory chunks are often used as 'swap' by the NIC,
>     so it will be both reading and writing to these areas.
>=20
>     This seems to fix errors like this on my x86-64 machine:
>=20
>     kernel: DMAR: DMAR:[DMA Write] Request device [05:00.0] fault addr
> ff5de000
>             DMAR:[fault reason 05] PTE Write access is not set
>=20
>     Should be tested and verified by someone who uses other platforms
>     though...
>=20
>     Signed-off-by: Ben Greear <greearb@candelatech.com>
>=20
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c
> b/drivers/net/wireless/ath/ath10k/wmi.c
> index af37a77..502f0e0 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4404,7 +4404,7 @@ static int ath10k_wmi_alloc_chunk(struct ath10k
> *ar, u32 req_id,
>         if (!num_units)
>                 return -ENOMEM;
>=20
> -       paddr =3D dma_map_single(ar->dev, vaddr, pool_size, DMA_TO_DEVI=
CE);
> +       paddr =3D dma_map_single(ar->dev, vaddr, pool_size,
> DMA_BIDIRECTIONAL);
>         if (dma_mapping_error(ar->dev, paddr)) {
>                 kfree(vaddr);
>                 return -ENOMEM;
> [greearb@ben-dt ath10k]$
>=20
>>
>> -Rajkumar
>> ________________________________________
>> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Ben
>> Skeggs <bskeggs@redhat.com>
>> Sent: Friday, July 8, 2016 10:59 AM
>> To: ath10k@lists.infradead.org
>> Subject: AR9882 IOMMU faults
>>
>> Hey,
>>
>> I've just installed a COMPEX WLE600VX (AR9882) in my router machine,
>> operating in AP mode.
>>
>> While it appears to be working well enough, I get massive floods of
>> IOMMU faults reported in my kernel log.  These appear to increase with=

>> the load on the network.
>>
>> I've attached both the info that ath10k reports when it detects the
>> device, and a sample of one of the DMAR messages (worth nothing that
>> it's the same fault address in all the messages).
>>
>> Is this a known issue, and anything I can do to help get it resolved?
>>
>> Thanks,
>> Ben.
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>=20


--h1uCgCa9hurU6t7IskMcRX1IMVWhbVkeQ--

--iXMejWp1eev3N0gwN1TQa88FKITDeX242
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXgDsZAAoJEHYLnGJQkpH727YP/1+hkxJCC6eOF4cVMuVH9Ajy
qNc9OK0wRC0v+tobxzZw/O5NdZQzq7XA4R78nIb8jSDwT21mwjWaOI2aAtmsxqPs
YHJndcPNbxFlgBDHowlxmRmOEhvccyUMKR9hiVmqumxrzbaKQKebGdbMLLyT3Wkh
avgRf7ew/4aTC1mRU1vOBxpksMPcTPXZ/1olMzgl9bSffsF3SwRPmNrCsknnEVQU
Rn+2iyrftEHd6Yv8uJM8USg+4GEIFF+jLh8KQwTu8JuPIQ8GvgyEA8hNsjdSGof2
l2yNf2svSyHslmQlBj591qZ4R4YrFzqvwckmS0NR/OP5TURPMFqe0WsTlteBwqs+
Nf9Qj3U8RVsMPWAeRi3GLNG5wq6fGMZ0nPEpWItQKmnJFLGtdZXeLUpRRd0jgyUa
LwjREEjA5erDXS2v/ho2l+WOdNOrcO5ZaL5aO8ZVLSpfUgHB3H13u8PpjeiRnN4/
2apw66JFOrKcDJP3HUsaXrUuj/NIFO/Ux79d+g7htGUA3aEkGzuW/nKVTNihvfkA
Nw4Tc4XfgJ5Vv2lpXf9KP2PQKk7P1bgCJ3fScIH+mbtRlkT/va3NqiK4Nv73FGeX
L9jFyP4pqwX2Ty77ZKCfBtxX5C4EC8B7vSQVWdMvTwbLgBlm5uMw9mCYFnB9ztbb
HRExcm00S8/O0gLZiJSm
=mFsW
-----END PGP SIGNATURE-----

--iXMejWp1eev3N0gwN1TQa88FKITDeX242--


--===============7499904732280155248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7499904732280155248==--
